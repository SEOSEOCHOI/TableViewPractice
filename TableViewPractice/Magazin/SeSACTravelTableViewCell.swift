import UIKit

class SeSACTravelTableViewCell: UITableViewCell {

    @IBOutlet var photoImage: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    
    @IBOutlet var subtitleLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    
    func design() {
        photoImage.contentMode = .scaleAspectFill
        photoImage.layer.cornerRadius = 10
        
        titleLabel.font = .boldSystemFont(ofSize: 20)
        titleLabel.numberOfLines = 2
        titleLabel.lineBreakMode = .byWordWrapping
        
        subtitleLabel.textColor = .gray
        subtitleLabel.font = .systemFont(ofSize: 14)
         
        
        dateLabel.textColor = .gray
        dateLabel.font = .systemFont(ofSize: 14)
    }
    
    func configureCell(data: Magazine) {
        
        titleLabel.text = data.title
        subtitleLabel.text = data.subtitle
        
        //MARK: Date
        let format = DateFormatter()
        format.dateFormat = "yyMMdd"
        if let date = format.date(from: data.date) {
            format.dateFormat = "yy년 MM월 dd일"
            let resultDate = format.string(from: date)
            dateLabel.text = resultDate
        }
    }
    
}
