import UIKit

// 내용 확장해서 UserDefault 적용해 보기
class ShoppingTableViewController: UITableViewController {
    
    @IBOutlet var searchTextField: UITextField!
    @IBOutlet var searchButton: UIButton!
    
    
    var shoppingList: [Shopping] = [Shopping(todo: "그립톡 구매하기", check: false, important: false),
                                    Shopping(todo: "사이다 구매", check: false, important: false),
                                    Shopping(todo: "아이패드 케이스 최저가 알아보기", check: false, important: false),
                                    Shopping(todo: "양말", check: false, important: false)]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchViewDesign()
    }
    
    @IBAction func searhButtonClicked(_ sender: UIButton) {
        if let search = searchTextField.text {
            
            shoppingList.append(Shopping(todo: search, check: false, important: false))
            
            tableView.reloadData()
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
        
        let indexRow = indexPath.row
        let shoppingCell = shoppingList[indexRow]
        
        cell.configureCell(data: shoppingCell)

        cell.checkButton.tag = indexPath.row
        cell.checkButton.addTarget(self, action: #selector(checkButtonClicked), for: .touchUpInside)
        
        cell.starButton.tag = indexPath.row
        cell.starButton.addTarget(self, action: #selector(starButtonClicked), for: .touchUpInside)
        
        return cell
    }
    
    @objc func checkButtonClicked(sender: UIButton) {
        shoppingList[sender.tag].check.toggle()
        
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    @objc func starButtonClicked(sender: UIButton) {
        shoppingList[sender.tag].important.toggle()
        tableView.reloadRows(at: [IndexPath(row: sender.tag, section: 0)], with: .fade)
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            shoppingList.remove(at: indexPath.row)
            tableView.reloadData()
        }
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
