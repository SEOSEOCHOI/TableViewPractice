import UIKit

class CityVersion2CollectionViewCell: UICollectionViewCell {

    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityEnglishName: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImageView.contentMode = .scaleAspectFill
        cityImageView.layer.cornerRadius = 60
        
        cityEnglishName.font = .boldSystemFont(ofSize: 15)
        cityNameLabel.font = .boldSystemFont(ofSize: 15)
        
        cityExplainLabel.font = .systemFont(ofSize: 13)
        cityExplainLabel.textColor = .gray
        cityExplainLabel.numberOfLines = 0
        cityExplainLabel.textAlignment = .center
        
    }

}
