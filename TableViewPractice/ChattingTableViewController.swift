import UIKit

class ChattingTableViewController: UITableViewController {
    
    var nameArray = ["최서경", "Jack", "Hue", "Ded", "Bran", "이지원", "이현민", "황한샘"]
    var profileImageArray = [UIImage(named: "부케")!, UIImage(named: "쭈니")!, UIImage(named: "늑태")!, UIImage(named: "아폴로")!, UIImage(named: "kk")!, UIImage(named: "사이다"), UIImage(named: "유네찌"), UIImage(named: "실바나")]
    var messageArray = ["안녕", "반가워", "뭐 해?", "밥 먹었어?", "뭐 먹을래?", "주말에 만날래?", "일어나 코딩홰야지", "ㅠㅠ"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChattingTableViewCell", for: indexPath) as! ChattingTableViewCell
        

        for count in 0 ... nameArray.count - 1 {
            if count == indexPath.row {
                cell.nameLabel.text = nameArray[count]
                cell.nameLabel.font = .systemFont(ofSize: 15)
                
                cell.profileImageView.image = profileImageArray[count]
                cell.profileImageView.contentMode = .scaleAspectFill
                cell.profileImageView.layer.cornerRadius = 20
                cell.profileImageView.layer.borderWidth = 1
                cell.profileImageView.layer.borderColor = UIColor.systemGray5.cgColor
                
                cell.messageLabel.text = messageArray[count]
                cell.messageLabel.font = .systemFont(ofSize: 13)
                cell.messageLabel.textColor = .gray
                cell.messageLabel.numberOfLines = 2
                
                cell.timeLabel.text = "12:00"
                cell.timeLabel.font = .systemFont(ofSize: 14)
                cell.timeLabel.textColor = .gray
                
                cell.newMessageCountLabel.text = ("\(Int.random(in: 0...10))")
                cell.newMessageCountLabel.font = .systemFont(ofSize: 12)
                cell.newMessageCountLabel.textColor = .white
                cell.newMessageCountLabel.backgroundColor = .red
                cell.newMessageCountLabel.layer.cornerRadius = 15
                cell.newMessageCountLabel.clipsToBounds = true
                cell.newMessageCountLabel.textAlignment = .center
                
            }
        }
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}

