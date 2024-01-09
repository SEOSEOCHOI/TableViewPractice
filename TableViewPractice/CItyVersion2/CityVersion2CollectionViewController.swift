import UIKit
import Kingfisher

class CityVersion2CollectionViewController: UICollectionViewController {

    let cityList: [City] = CityInfo().city
    override func viewDidLoad() {
        super.viewDidLoad()
    // 3. 셀 너비 * 높이
        // XIB
        let xib = UINib(nibName: "CityVersion2CollectionViewCell", bundle: nil)
        collectionView.register(xib, forCellWithReuseIdentifier: "CityVersion2CollectionViewCell")        // layout
        let layout = UICollectionViewFlowLayout()
        
        let spacing: CGFloat = 10
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellWidth / 2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        
        collectionView.collectionViewLayout = layout
        
        
    }
    
    // 1. 아이템 개수
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }

    // 2. 데이터 처리 및 디자인
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityVersion2CollectionViewCell", for: indexPath) as! CityVersion2CollectionViewCell
        
        let city = cityList[indexPath.item]
        
        let url = URL(string: city.city_image)
        cell.cityImageView.kf.setImage(with: url)
        
        cell.cityNameLabel.text = ("\(city.city_name) | ")
        
        cell.cityEnglishName.text = ("\(city.city_english_name)")
        
        cell.cityExplainLabel.text = ("\(city.city_explain)")
        
        return cell
    }
}
