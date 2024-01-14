//
//  ChatroomViewController.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/12/24.
//

import UIKit

class ChatroomViewController: UIViewController {

    var data =  ChatRoom(chatroomId: 0, chatroomImage: [], chatroomName: "데이터", chatList: [])
        
    @IBOutlet var chatTableView: UITableView!
    


    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        configureNavigation()
        configureTableView()
    }

}
// MARK: UI
extension ChatroomViewController: ViewProtocol {
    func configureView() {
        let xib = UINib(nibName: "SenderChatTableViewCell", bundle: nil)
        chatTableView.register(xib, forCellReuseIdentifier: "SenderChatTableViewCell")
        
        let oppositeXib = UINib(nibName: "OppositeChatTableViewCell", bundle: nil)
        chatTableView.register(oppositeXib, forCellReuseIdentifier: "OppositeChatTableViewCell")

    }
}
// MARK: Navigation
extension ChatroomViewController {
    func configureNavigation() {
        navigationItem.title = data.chatroomName
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "chevron.left"), style: .plain, target: self, action: #selector(backController))
        navigationItem.leftBarButtonItem?.tintColor = .gray
    }
    @objc func backController() {
        navigationController?.popViewController(animated: true)
    }
}
//MARK: TableView
extension ChatroomViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.chatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = data.chatList[indexPath.row]

        
        
        if row.user == .user {
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "SenderChatTableViewCell", for: indexPath) as! SenderChatTableViewCell
            
            
            cell.messageLabel.text = row.message
            

            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd HH:mm"
            let backToDate: Date = format.date(from: row.date) ?? Date()
            format.dateFormat = "hh:mm"
            let resultTime = format.string(from: backToDate)
            cell.timeLabel.text = resultTime
            return cell
        } else {
            let cell = chatTableView.dequeueReusableCell(withIdentifier: "OppositeChatTableViewCell", for: indexPath) as! OppositeChatTableViewCell
            
            cell.profilImagevView.image = UIImage(named: data.chatList[indexPath.row].user.profileImage)

            cell.nameLabel.text = row.user.rawValue
            cell.messageLabel.text = row.message

            let format = DateFormatter()
            format.dateFormat = "yyyy-MM-dd HH:mm"
            let backToDate: Date = format.date(from: row.date) ?? Date()
            format.dateFormat = "hh:mm"
            let resultTime = format.string(from: backToDate)
            cell.timeLabel.text = resultTime
            return cell
        }
    }
}

extension ChatroomViewController {
    func configureTableView() {
        chatTableView.delegate = self
        chatTableView.dataSource = self
        
        chatTableView.separatorColor = .white
    }
}

