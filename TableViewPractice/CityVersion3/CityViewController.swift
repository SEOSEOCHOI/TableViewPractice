import UIKit
import Kingfisher


enum CitySegment: Int, CaseIterable {
    case 모두 = 0
    case 국내 = 1
    case 헤외 = 2
}


class CityViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let cityList: [City] = CityInfo().city

    @IBOutlet var cityCollectionView: UICollectionView!
    
    @IBOutlet var citySegment: UISegmentedControl!
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityVersion2CollectionViewCell", for: indexPath) as! CityVersion2CollectionViewCell
        
        let item = cityList[indexPath.item]
        
        let url = URL(string: item.city_image)
        cell.cityImageView.kf.setImage(with: url)
        cell.configureCell(data: item)
         
        /*
         if item.domestic_travel == true {
             cell.cityImageView.kf.setImage(with: url)
             cell.configureCell(data: item)
         } else {
             cell.isHidden = true
         }
         */

        return cell
        
    }
    
    @IBAction func citySegmentClicked(_ sender: UISegmentedControl) {
        
        if sender.selectedSegmentIndex == 0 {
            print("모두 클릭")

        } else if sender.selectedSegmentIndex == 1 {
            print("국내 클릭")
        } else {
            print("헤외 클릭")
        }
        
        cityCollectionView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let xib = UINib(nibName: "CityVersion2CollectionViewCell", bundle: nil)
        cityCollectionView.register(xib, forCellWithReuseIdentifier: "CityVersion2CollectionViewCell")
        // CollectionView 와 부하들 연결
        cityCollectionView.dataSource = self
        cityCollectionView.delegate = self
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 10
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellWidth / 2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        
        cityCollectionView.collectionViewLayout = layout
        
        let segmentValue = CitySegment.allCases

        for segment in segmentValue {
            citySegmentDesign(title: ("\(segment)"), at: segment.rawValue)
            //print(segment, segment.rawValue)
        }


    }

    
    func citySegmentDesign(title: String, at: Int) {
        // segmented control을 다룰 줄 몰라서 inspector 영역에서 갯수 지정해 주었습니다 🥺
        citySegment.setTitle(title, forSegmentAt: at)

        
    }
}
