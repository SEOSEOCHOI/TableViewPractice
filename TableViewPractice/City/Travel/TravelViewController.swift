//
//  TravelViewController.swift
//  TableViewPractice
//
//  Created by 최서경 on 1/11/24.
//

import UIKit
import Kingfisher

class TravelViewController: UIViewController {
    @IBOutlet var travelTableVeiw: UITableView!
    @IBOutlet var lineView: UIView!
    
    let travelList: [Travel] = TravelInfo().travel
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureTableView()
        navigationItem.title = "도시 상세 정보"
        lineView.backgroundColor = .lightGray
        
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
    
}
// UI
extension TravelViewController {
    func configureTableView() {
        travelTableVeiw.delegate = self
        travelTableVeiw.dataSource = self
        
        let xib = UINib(nibName: "TravelTableViewCell", bundle: nil)
        travelTableVeiw.register(xib, forCellReuseIdentifier: "TravelTableViewCell")
        
        let adxib = UINib(nibName: "ADTableViewCell", bundle: nil)
        travelTableVeiw.register(adxib, forCellReuseIdentifier: "ADTableViewCell")
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if travelList[indexPath.row].ad == false {
            _ = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
            
            let sb = UIStoryboard(name: "TourSpot", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "TourSpotViewController") as! TourSpotViewController
            
            let nav = UINavigationController(rootViewController: vc)
            
            present(nav, animated: true)
            
            
        } else {
            _ = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell

            let sb = UIStoryboard(name: "Advertisement", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "AdvertisementViewController") as! AdvertisementViewController
            
            let nav = UINavigationController(rootViewController: vc)
            
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        }

        tableView.reloadRows(at: [indexPath], with: .fade)
    }
}

// MARK: TableView
extension TravelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return travelList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let item = travelList[indexPath.row]
        
        if travelList[indexPath.row].ad == false {
            let cell = tableView.dequeueReusableCell(withIdentifier: TravelTableViewCell.identifier, for: indexPath) as! TravelTableViewCell
            
            if let travelImage = item.travel_image {
                let url = URL(string: travelImage)
                cell.travelImageView.kf.setImage(with: url)
                
                cell.configureCell(data: item)
            }
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ADTableViewCell.identifier, for: indexPath) as! ADTableViewCell
            
            cell.configureCell(data: item)
            
            return cell
        }
    }
}
