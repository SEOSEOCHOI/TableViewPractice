import UIKit
import Kingfisher

class SeSACTravelTableViewController: UITableViewController {
    var magazinList: [Magazine] = MagazineInfo().magazine
    
    let identifire = "SeSACTravelTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return magazinList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: identifire, for: indexPath) as! SeSACTravelTableViewCell
        let url = URL(string: magazinList[indexPath.row].photo_image)
        let item = magazinList[indexPath.row]
        
        cell.photoImage.kf.setImage(with: url)

        cell.design()
        cell.configureCell(data: item)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 550
    }
}
