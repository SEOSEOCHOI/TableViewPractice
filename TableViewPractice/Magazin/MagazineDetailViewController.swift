//
//  MagazineDetailViewController.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/15/24.
//

import UIKit
import WebKit

class MagazineDetailViewController: UIViewController {
    
    var urlString: String = "url"
    
    @IBOutlet var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            
            webView.load(request)
        }
        
        
        navigationItem.title = "세부 정보"

    }
    

}
