//
//  TravelTableViewCell.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/11/24.
//

import UIKit

class TravelTableViewCell: UITableViewCell {
    
    static let identifier = "TravelTableViewCell"
    
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!
    @IBOutlet var starImageView: [UIImageView]!
    @IBOutlet var reviewLabel: UILabel!
    @IBOutlet var saveLabel: UILabel!
    @IBOutlet var travelImageView: UIImageView!
    @IBOutlet var likeButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        travelImageView.contentMode = .scaleAspectFill
        travelImageView.layer.cornerRadius = 10
        travelImageView.clipsToBounds = true
        
        titleLabel.font = .systemFont(ofSize: 17)
        
        infoLabel.numberOfLines = 0
        infoLabel.setExplainLabelDesign()
        reviewLabel.setExplainLabelDesign()
        saveLabel.setExplainLabelDesign()
        
        likeButton.setTitle("", for: .normal)
        likeButton.tintColor = .systemPink
        
        for count in 0 ... starImageView.count - 1 {
            starImageView[count].image = UIImage(systemName: "star.fill")
            starImageView[count].tintColor = .lightGray
            
        }
        
    }
}

extension TravelTableViewCell: cellDesignProtocol {
    func configureCell(data: Any) {
        titleLabel.text = (data as! Travel).title
        infoLabel.text = (data as! Travel).description
        let saveNumber = saveLabel.setDecimalNumber(requestIntValue: Int.random(in: 0...5000))
        reviewLabel.text = "(\(saveNumber))・"
        
        if let heart = (data as! Travel).like {
            let heartImge = heart ? "heart" : "heart.fill"
            likeButton.setImage(UIImage(systemName: heartImge), for: .normal)
        }
        
        if let save = (data as! Travel).save {
            let saveNumber = saveLabel.setDecimalNumber(requestIntValue: save)
            saveLabel.text = "저장 \(saveNumber)"
        }
        
        if let grade = (data as! Travel).grade {
            let grade: Int = Int(grade)
            print(grade)
            switch grade {
            case 1, 2, 3, 4, 5:
                starColorSetting(grade: grade)
            default:
                starColorSetting(grade: grade)
            }
        }
    }
}


// 디자인 + 조건
extension TravelTableViewCell {
    func starColorSetting(grade: Int) {
        for starCount in 0...grade - 1 {
            starImageView[starCount].tintColor = .yellow
        }
    }
}
