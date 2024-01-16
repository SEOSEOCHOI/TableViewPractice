//
//  CellProtocol.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/15/24.
//

import UIKit

protocol ReuseableProtocol {
    static var identifire: String { get }
}


extension UITableViewCell: Repeatable {
    static var identifire: String {
        return String(describing: self)
    }
}
