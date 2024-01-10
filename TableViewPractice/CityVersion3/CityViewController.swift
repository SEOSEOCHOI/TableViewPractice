import UIKit
import Kingfisher

protocol layoutProtocol {
    func setLayout()
}

// emum을 optional initializer로 만들어 보기
enum CitySegment: Int, CaseIterable {
    case 모두 = 0
    case 국내 = 1
    case 헤외 = 2
}


class CityViewController: UIViewController {
    
    var cityList: [City] = []
    
    let allCityList: [City] = CityInfo().city
    
    @IBOutlet var cityCollectionView: UICollectionView!
    
    @IBOutlet var citySegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "CityVersion2CollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityVersion2CollectionViewCell")
        // CollectionView 와 부하들 연결
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        setLayout()

        cityList = allCityList
        
        let segmentValue = CitySegment.allCases
        for segment in segmentValue {
            citySegmentDesign(title: ("\(segment)"), at: segment.rawValue)
            //print(segment, segment.rawValue)
        }
    }
    
    @IBAction func citySegmentClicked(_ sender: UISegmentedControl) {
        cityList = []
        if sender.selectedSegmentIndex == 0 {
            cityList = allCityList
        } else if sender.selectedSegmentIndex == 1 {
            for city in allCityList {
                if city.domestic_travel == true {
                    cityList.append(city)
                }
            }
        } else {
            print("헤외 클릭")
            for city in allCityList {
                if city.domestic_travel != true {
                    cityList.append(city)
                }
            }
        }
        cityCollectionView.reloadData()
    }

    func citySegmentDesign(title: String, at: Int) {
        // segmented control을 다룰 줄 몰라서 inspector 영역에서 갯수 지정해 주었습니다 🥺
        citySegment.setTitle(title, forSegmentAt: at)
    }
}

extension CityViewController: UICollectionViewDelegate {
    
}

extension CityViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityVersion2CollectionViewCell", for: indexPath) as! CityVersion2CollectionViewCell
        
        let item = cityList[indexPath.item]
        
        let url = URL(string: item.city_image)
        cell.cityImageView.kf.setImage(with: url)
        cell.configureCell(data: item)
        
        return cell
    }
}

extension CityViewController: layoutProtocol {
    func setLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let cellWidth = (UIScreen.main.bounds.width - (spacing * 3)) / 2
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth * 1.3)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        
        cityCollectionView.collectionViewLayout = layout
    }
}
