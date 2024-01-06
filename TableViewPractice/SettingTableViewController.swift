//
//  SettingTableViewController.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/5/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    var entireSettingList = ["공지사항", "실험실", "버전 정보"]
    var personalSettingList = ["개인/보안", "알림", "채팅", "멀티프로필"]
    var etcList = ["고객센터/도움말"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // 섹션의 개수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // 셀의 개수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return entireSettingList.count
        } else if section == 1 {
            return personalSettingList.count
        } else {
            return etcList.count
        }
    }
    
    // 디자인 및 데이터 처리
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingCell")
        
        if indexPath.section == 0 {
            cell?.textLabel?.text = entireSettingList[indexPath.row]
        } else if indexPath.section == 1 {
            cell?.textLabel?.text = personalSettingList[indexPath.row]
            
        } else {
            cell?.textLabel?.text = etcList[indexPath.row]
            
        }
        return cell!
    }
    
    // 셀의 높이
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // 헤더 설정
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "전체 설정"
        } else if section == 1 {
            return "개인 설정"
        } else {
            return "기타"
        }
    }
}
