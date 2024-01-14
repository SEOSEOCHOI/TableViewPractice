//
//  OppositeChatTableViewCell.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/14/24.
//

import UIKit

class OppositeChatTableViewCell: UITableViewCell {

    @IBOutlet var profilImagevView: UIImageView!
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageBackgroundView: UIView!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        profilImagevView.contentMode = .scaleAspectFill
        DispatchQueue.main.async {
            self.profilImagevView.layer.cornerRadius = self.profilImagevView.frame.width / 2
        
        }
        
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.numberOfLines = 0
        
        messageBackgroundView.backgroundColor = .white
        messageBackgroundView.layer.borderWidth = 1
        messageBackgroundView.layer.borderColor = UIColor.gray.cgColor
        messageBackgroundView.layer.cornerRadius = 10

        timeLabel.font = .systemFont(ofSize: 11)
        timeLabel.textColor = .lightGray
        timeLabel.textAlignment = .left
        
        
    }
}


