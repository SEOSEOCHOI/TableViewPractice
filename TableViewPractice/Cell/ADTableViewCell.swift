//
//  ADTableViewCell.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/11/24.
//

import UIKit

class ADTableViewCell: UITableViewCell {
    
    static let identifier = "ADTableViewCell"

    
    @IBOutlet var backView: UIView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var adLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backView.backgroundColor = UIColor(red: CGFloat.random(in: 0...1), green: CGFloat.random(in: 0...1), blue: CGFloat.random(in: 0...1), alpha: 1)
        backView.layer.cornerRadius = 10
        
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        titleLabel.font = .boldSystemFont(ofSize: 17)
        
        adLabel.text = "AD"
        adLabel.backgroundColor = .white
        adLabel.layer.cornerRadius = 5
        adLabel.clipsToBounds = true
        adLabel.font = .systemFont(ofSize: 13)
        adLabel.textAlignment = .center
    }
}

extension ADTableViewCell: cellDesignProtocol {
    func configureCell(data: Any) {

        titleLabel.text = (data as! Travel).title
    }
}
