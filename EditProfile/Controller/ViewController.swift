import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var TableView: UITableView!
    
    @IBOutlet weak var prifileView: UIView!
    
    @IBOutlet weak var prifileImageView: UIImageView!
    
    var profileImage: UIImage = UIImage(named: "prifilePlaceHolder")!
    
    var profileData:[String: String] = [
        "FistName":"",
        "LastName":"",
        "Phone":"",
        "Email":"",
        "About":""
    ]
    
    // MARK: Override func:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prifileImageView.image = profileImage
        
        addGasture()
    }
    
    // MARK: Actions:
    
    @objc func imageTapped() {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "UploadPhotoVC") as! UploadPhotoVC
        vc.selectedImg = prifileImageView.image
        vc.sendData = getProfileImg(_:)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    // MARK: Function:
    
    private func addGasture(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        prifileView.addGestureRecognizer(tapGestureRecognizer)
        prifileView.isUserInteractionEnabled = true
    }
    
    private func getProfileImg(_ img: UIImage) {
        
        self.prifileImageView.image = img
    }
    
    private func getFistName(_ fistTxt: String) {
        
        profileData["FistName"] = fistTxt
        TableView.reloadData()
    }
    
    private func getLastName(_ lastTxt: String) {
        
        profileData["LastName"] = lastTxt
        TableView.reloadData()
    }
    
    private func getPhone(_ text: String) {
        
        profileData["Phone"] = text
        TableView.reloadData()
    }
    
    private func getEmail(_ text: String) {
        
        profileData["Email"] = text
        TableView.reloadData()
    }
    
    private func getAbout(_ text: String) {
        
        profileData["About"] = text
        TableView.reloadData()
    }
}

// MARK: Table View Delegate:

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 4
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! ProfileTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.lbl_title.text = "Name"
            cell.lbl_detail.text = "\(profileData["FistName"] ?? "") \(profileData["LastName"] ?? "")"
        case 1:
            cell.lbl_title.text = "Phone"
            cell.lbl_detail.text = profileData["Phone"]
        case 2:
            cell.lbl_title.text = "Email"
            cell.lbl_detail.text = profileData["Email"]
        case 3:
            cell.lbl_title.text = "Tell us about yourself"
            cell.lbl_detail.text = profileData["About"]
            
        default: break
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        switch indexPath.row {
        case 0:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "NameEditVC") as! NameEditVC
            vc.fistNameText = profileData["FistName"] ?? ""
            vc.lastNameText = profileData["LastName"] ?? ""
            vc.sendFistData = getFistName(_:)
            vc.sendLastData = getLastName(_:)
            navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "PhoneEditVC") as! PhoneEditVC
            vc.phoneText = profileData["Phone"] ?? ""
            vc.sendData = getPhone(_:)
            navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "EmailEditVC") as! EmailEditVC
            vc.emailText = profileData["Email"] ?? ""
            vc.sendData = getEmail(_:)
            navigationController?.pushViewController(vc, animated: true)
            
        case 3:
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "AboutEditVC") as! AboutEditVC
            vc.aboutText = profileData["About"] ?? ""
            vc.sendData = getAbout(_:)
            navigationController?.pushViewController(vc, animated: true)
            
        default: break
        }
    }
}
