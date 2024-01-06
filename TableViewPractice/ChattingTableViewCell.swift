//
//  ChattingTableViewCell.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/6/24.
//

import UIKit

class ChattingTableViewCell: UITableViewCell {

    @IBOutlet var profileImageView: UIImageView!
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var personnelLabel: UILabel!

    @IBOutlet var muteImageView: UIImageView!
    
    @IBOutlet var pinImageView: UIImageView!
    
    @IBOutlet var timeLabel: UILabel!
    
    @IBOutlet var newMessageCountLabel: UILabel!
}
