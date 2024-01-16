import UIKit
import Kingfisher

protocol layoutProtocol {
    func setLayout()
}

// emum을 optional initializer로 만들어 보기
enum CitySegment: Int, CaseIterable {
    case 모두 = 0
    case 국내 = 1
    case 해외 = 2
}

class CityViewController: UIViewController {
    
    var cityList: [City] = [] {
        didSet {
            cityCollectionView.reloadData()
        }
    }
    
    var segmentedCityList: [City] = []
    
    let allCityList = CityInfo().city
    
    @IBOutlet var cityCollectionView: UICollectionView!
    
    @IBOutlet var citySegment: UISegmentedControl!
    
    @IBOutlet var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
    }
    
    @IBAction func citySegmentClicked(_ sender: UISegmentedControl) {
        segmentedCityList = []
        cityList = []
        if sender.selectedSegmentIndex == 0 {
//            segmentedCityList = allCityList
//            cityList = segmentedCityList
            
            for city in allCityList {
                    segmentedCityList.append(city)
                    cityList = segmentedCityList
            }
            
        } else if sender.selectedSegmentIndex == 1 {
            for city in allCityList {
                if city.domestic_travel == true {
                    segmentedCityList.append(city)
                    cityList = segmentedCityList
                }
            }
        } else {
            for city in allCityList {
                if city.domestic_travel != true {
                    segmentedCityList.append(city)
                    cityList = segmentedCityList
                    //cityList.append(city)
                }
            }
        }
    }
    
    func citySegmentDesign(title: String, at: Int) {
        // segmented control을 다룰 줄 몰라서 inspector 영역에서 갯수 지정해 주었습니다 🥺
        citySegment.setTitle(title, forSegmentAt: at)
    }
}

// MARK: CollectionView
extension CityViewController: UICollectionViewDelegate ,UICollectionViewDataSource {
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

// MARK: UI
extension CityViewController {
    func configureCollectionView() {
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Travel", bundle: nil)
        let travelViewController = sb.instantiateViewController(withIdentifier: "TravelViewController") as! TravelViewController
        
        navigationController?.pushViewController(travelViewController, animated: true)
    }
}

//MARK: SearchBar
extension CityViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        var filterData: [City] = []

        if searchBar.text == "" {
            cityList = segmentedCityList
        } else {
            for item in cityList {
                if item.city_name.contains(searchBar.text!) ||
                    item.city_english_name.contains(searchBar.text!) ||
                    item.city_explain.contains(searchBar.text!) {
                    filterData.append(item)
                }
            }
            cityList = filterData
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        var filterData: [City] = []

        if searchBar.text == "" {
            cityList = segmentedCityList
        } else {
            for item in cityList {
                if item.city_name.contains(searchBar.text!) ||
                    item.city_english_name.contains(searchBar.text!) ||
                    item.city_explain.contains(searchBar.text!) {
                    filterData.append(item)
                }
            }
            cityList = filterData
        }
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
        cityList = segmentedCityList
    }
}

