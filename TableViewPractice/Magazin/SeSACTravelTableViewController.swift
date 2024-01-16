import UIKit
import Kingfisher

class SeSACTravelTableViewController: UITableViewController {
    var magazinList: [Magazine] = MagazineInfo.magazine
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

// MARK: Table View
extension SeSACTravelTableViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazinList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SeSACTravelTableViewCell.identifire, for: indexPath) as! SeSACTravelTableViewCell
        let url = URL(string: magazinList[indexPath.row].photo_image)
        let item = magazinList[indexPath.row]
        cell.photoImage.kf.setImage(with: url)
        
        cell.design()
        cell.configureCell(data: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "MagazineDetail", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: MagazineDetailViewController.identifire) as! MagazineDetailViewController
        
        vc.urlString = magazinList[indexPath.row].link
        
        present(vc, animated: true)
    }
}
    

