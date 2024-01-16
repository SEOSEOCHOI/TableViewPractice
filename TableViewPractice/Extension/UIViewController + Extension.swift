//
//  UIViewController + Extension.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/15/24.
//

import UIKit


extension UIViewController: ReuseableProtocol {
    static var identifire: String {
        return String(describing: self)
    }
}
