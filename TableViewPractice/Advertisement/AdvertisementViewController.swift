//
//  AdvertisementViewController.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/11/24.
//

import UIKit

class AdvertisementViewController: UIViewController {

    @IBOutlet var lineView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "상세 화면"
        lineView.backgroundColor = .lightGray
    }
    
    @IBAction func backButtonClicked(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
