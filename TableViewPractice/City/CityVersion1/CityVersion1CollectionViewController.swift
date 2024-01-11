import UIKit
import Kingfisher


class CityVersion1CollectionViewController: UICollectionViewController {
    
    let cityList: [City] = CityInfo().city

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 5
        let cellWidth = UIScreen.main.bounds.width - (spacing * 3)
        layout.itemSize = CGSize(width: cellWidth / 2, height: cellWidth / 2)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        
        collectionView.collectionViewLayout = layout

    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cityList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CityVersion1CollectionViewCell", for: indexPath) as! CityVersion1CollectionViewCell
        
        let url = URL(string: cityList[indexPath.item].city_image)

        cell.cityImageView.kf.setImage(with: url)
        cell.cityImageView.contentMode = .scaleAspectFill
        cell.cityImageView.layer.cornerRadius = 70
        
        cell.cityEnglishNameLabel.text = cityList[indexPath.item].city_english_name
        cell.cityEnglishNameLabel.font = .boldSystemFont(ofSize: 15)
        
        cell.cityNameLabel.text = ("\(cityList[indexPath.item].city_name) | ")
        cell.cityNameLabel.font = .boldSystemFont(ofSize: 15)
        
        cell.cityExplainLabel.text = cityList[indexPath.item].city_explain
        cell.cityExplainLabel.font = .systemFont(ofSize: 13)
        cell.cityExplainLabel.textColor = .gray
        cell.cityExplainLabel.numberOfLines = 0
        cell.cityExplainLabel.textAlignment = .center
        
        return cell
    }

}
