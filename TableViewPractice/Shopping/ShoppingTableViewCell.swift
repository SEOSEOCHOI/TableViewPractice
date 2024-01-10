import UIKit

class ShoppingTableViewCell: UITableViewCell {

    @IBOutlet var cellView: UIView!
    @IBOutlet var checkButton: UIButton!
    @IBOutlet var objectLabel: UILabel!
    @IBOutlet var starButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        checkButton.setTitle("", for: .normal)
        checkButton.tintColor = .black
        
        starButton.setTitle("", for: .normal)
        starButton.tintColor = .black
        
        objectLabel.font = .systemFont(ofSize: 14)
        
        cellView.backgroundColor = .tertiarySystemFill
        cellView.layer.cornerRadius = 5
    }
    
    
}

extension ShoppingTableViewCell: cellDesignProtocol {
    func configureCell(data: Any) {
        if let object = data as? Shopping {
            objectLabel.text = object.todo
        }
        
        let checkImage = (data as! Shopping).check ? "checkmark.square" : "checkmark.square.fill"
        let importantImage = (data as! Shopping).important ? "star" : "star.fill"

        checkButton.setImage(UIImage(systemName: checkImage), for: .normal)
        starButton.setImage(UIImage(systemName: importantImage), for: .normal)
    }
}

