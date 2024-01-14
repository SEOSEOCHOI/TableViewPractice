//
//  TravelTalkViewController.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/12/24.
//

import UIKit

class TravelTalkViewController: UIViewController {
    @IBOutlet var friendSearhBar: UISearchBar!
    
    @IBOutlet var lineView: UIView!
    
    @IBOutlet var travelTalkTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        configureView()
        
        
    }
    
    
    
}

// MARK: View configure
extension TravelTalkViewController: ViewProtocol {
    func configureView() {
        
        navigationItem.title = "TRAVEL TALK"
        
        friendSearhBar.placeholder = "친구 이름을 검색해 보세요"
        friendSearhBar.searchBarStyle = .prominent
        
        lineView.backgroundColor = .lightGray
    }
}

// MARK: TableView
extension TravelTalkViewController {
    func configureTableView() {
        
        travelTalkTableView.delegate = self
        travelTalkTableView.dataSource = self
        
        travelTalkTableView.separatorColor = .white
        
        let xib = UINib(nibName: "TravelTalkTableViewCell", bundle: nil)
        travelTalkTableView.register(xib, forCellReuseIdentifier: "TravelTalkTableViewCell")
        
        let multiXib = UINib(nibName: "MultiTravelTalkTableViewCell", bundle: nil)
        travelTalkTableView.register(multiXib, forCellReuseIdentifier: "MultiTravelTalkTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Chatroom", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: "ChatroomViewController") as! ChatroomViewController
        
        vc.data = mockChatList[indexPath.row]
        
        navigationController?.pushViewController(vc, animated: true)        
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}


extension TravelTalkViewController:
    UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mockChatList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        
        let row = mockChatList[indexPath.row]

    
        if row.chatroomImage.count == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "TravelTalkTableViewCell", for: indexPath) as! TravelTalkTableViewCell
            
            cell.userNameLabel.text = row.chatroomName
            cell.userNameLabel.font = .boldSystemFont(ofSize: 15)
            
            if let lastTalk = row.chatList.last?.date {
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd HH:mm"
                let backToDate: Date = format.date(from: lastTalk) ?? Date()
                format.dateFormat = "yy.MM.dd"
                let resultDate = format.string(from: backToDate)
                cell.dateLabel.text = resultDate
            }
          
            cell.dateLabel.font = .systemFont(ofSize: 11)
            cell.dateLabel.textColor = .darkGray
            
            cell.messageLabel.text = row.chatList.last?.message
            cell.messageLabel.numberOfLines = 0
            cell.messageLabel.font = .systemFont(ofSize: 13)
            cell.messageLabel.textColor = .lightGray
            
            cell.userImageView.image = UIImage(named: row.chatroomImage[0])
            cell.userImageView.contentMode = .scaleAspectFill
            DispatchQueue.main.async {
                cell.userImageView.layer.cornerRadius = cell.userImageView.frame.width / 2 // xib값 한번 , 비율대로 오는 값 한번 하여 즉 두번 온다
            }
            return cell
            
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "MultiTravelTalkTableViewCell", for: indexPath) as! MultiTravelTalkTableViewCell
            cell.userNameLabel.text = row.chatroomName
            cell.userNameLabel.font = .boldSystemFont(ofSize: 15)
            
            if let lastTalk = row.chatList.last?.date {
                let format = DateFormatter()
                format.dateFormat = "yyyy-MM-dd HH:mm"
                let backToDate: Date = format.date(from: lastTalk) ?? Date()
                format.dateFormat = "yy.MM.dd"
                let resultDate = format.string(from: backToDate)
                cell.dateLabel.text = resultDate
            }

            cell.dateLabel.font = .systemFont(ofSize: 11)
            cell.dateLabel.textColor = .darkGray
            
            cell.messageLabel.text = row.chatList.last?.message
            cell.messageLabel.numberOfLines = 0
            cell.messageLabel.font = .systemFont(ofSize: 13)
            cell.messageLabel.textColor = .lightGray
            
            for count in 0 ... row.chatroomImage.count - 1 {
                
                cell.userImageView[count].image = UIImage(named: row.chatroomImage[count])
                
                
                cell.userImageView[count].contentMode = .scaleAspectFill
                DispatchQueue.main.async {
                    cell.userImageView[count].layer.cornerRadius = cell.userImageView[count].frame.width / 2 // xib값 한번 , 비율대로 오는 값 한번 하여 즉 두번 온다
                }
                
            }
            return cell
        }
        
        
    }
    
}

