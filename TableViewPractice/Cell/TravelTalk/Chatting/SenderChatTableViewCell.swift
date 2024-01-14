//
//  SenderChatTableViewCell.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/14/24.
//

import UIKit

class SenderChatTableViewCell: UITableViewCell {

    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var messageBackgorundView: UIView!
    @IBOutlet var timeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        confiureMessageLabel()
        configureMessageBackgroundView()
        configureTimeLabel()
    }
}

// MARK: Label
extension SenderChatTableViewCell {
    func confiureMessageLabel() {
        messageLabel.font = .systemFont(ofSize: 15)
        messageLabel.numberOfLines = 0

    }
    
    func configureMessageBackgroundView() {
        messageBackgorundView.layer.cornerRadius = 10
        messageBackgorundView.layer.borderWidth = 1
        messageBackgorundView.layer.borderColor = UIColor.gray.cgColor
        messageBackgorundView.layer.backgroundColor = UIColor.lightGray.cgColor
    }
    
    func configureTimeLabel() {
        timeLabel.font = .systemFont(ofSize: 11)
        timeLabel.textColor = .lightGray
        timeLabel.textAlignment = .right
    }
}

extension SenderChatTableViewCell: cellDesignProtocol {
    func configureCell(data: Any) {
//        messageLabel.text = (data as! ChatRoom).chatList[].message
//        timeLabel.text = (data as! ChatRoom).chatList[<#Int#>].date
    }
    
    
}
