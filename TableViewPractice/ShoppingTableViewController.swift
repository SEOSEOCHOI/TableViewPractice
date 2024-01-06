//
//  ShoppingTableViewController.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/5/24.
//

import UIKit

// 내용 확장해서 UserDefault 적용해 보기
class ShoppingTableViewController: UITableViewController {
  
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    var shoppingList = ["그립톡 구매하기", "사이다 구매", "아이패드 케이스 최저가 알아보기", "양말"] {
        didSet {
            tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchViewDesign()
    }
    
    @IBAction func searhButtonClicked(_ sender: UIButton) {
        if let search = searchTextField.text {
            shoppingList.append(search)
            
            // tableView.reloadData()
        }
    }
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return shoppingList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ShoppingTableViewCell", for: indexPath) as! ShoppingTableViewCell
        
        cell.checkButton.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        cell.checkButton.setTitle("", for: .normal)
        cell.checkButton.tintColor = .black
        
        cell.starButton.setImage(UIImage(systemName: "star"), for: .normal)
        cell.starButton.setTitle("", for: .normal)
        cell.starButton.tintColor = .black
        
        cell.objectLabel.text = shoppingList[indexPath.row]
        cell.objectLabel.font = .systemFont(ofSize: 14)
        
        cell.cellView.backgroundColor = .tertiarySystemFill
        cell.cellView.layer.cornerRadius = 5

        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    func searchViewDesign() {
        searchTextField.placeholder = "무엇을 구매하실 건가요?"
        searchTextField.clipsToBounds = true
        searchTextField.layer.cornerRadius = 5
        searchTextField.borderStyle = .none

        searchTextField.backgroundColor = . tertiarySystemFill
        
        searchButton.setTitle("추가", for: .normal)
        searchButton.backgroundColor = .systemGray5
        searchButton.layer.cornerRadius = 5
        searchButton.tintColor = .black
    }
}
