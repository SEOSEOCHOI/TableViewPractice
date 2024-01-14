//
//  TravelTalkTableViewCell.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/12/24.
//

import UIKit

class TravelTalkTableViewCell: UITableViewCell {


    @IBOutlet var userImageView: UIImageView!
    @IBOutlet var userNameLabel: UILabel!
    
    @IBOutlet var messageLabel: UILabel!
    
    @IBOutlet var dateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
