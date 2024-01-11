import UIKit

protocol cellDesignProtocol {
    func configureCell(data: Any)
}


class CityVersion2CollectionViewCell: UICollectionViewCell {
    @IBOutlet var cityImageView: UIImageView!
    @IBOutlet var cityNameLabel: UILabel!
    @IBOutlet var cityEnglishName: UILabel!
    @IBOutlet var cityExplainLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        cityImageView.contentMode = .scaleAspectFill
        
        cityEnglishName.font = .boldSystemFont(ofSize: 15)
        cityNameLabel.font = .boldSystemFont(ofSize: 15)
        
        cityExplainLabel.font = .systemFont(ofSize: 13)
        cityExplainLabel.textColor = .gray
        cityExplainLabel.numberOfLines = 0
        cityExplainLabel.textAlignment = .center
        
        // contentView.backgroundColor = .blue
    }
    override func draw(_ rect: CGRect) {
        cityImageView.layer.cornerRadius =  cityImageView.frame.width / 2
        cityImageView.clipsToBounds = true
    }
}

extension CityVersion2CollectionViewCell: cellDesignProtocol {
    func configureCell(data: Any) {
        cityNameLabel.text = "\((data as! City).city_name) | "
        
        cityEnglishName.text = "\((data as! City).city_english_name)"
        
        cityExplainLabel.text = "\((data as! City).city_explain)"
        
    }
}
