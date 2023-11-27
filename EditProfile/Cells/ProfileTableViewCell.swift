import UIKit

class ProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var lbl_title: UILabel!
    
    @IBOutlet weak var lbl_detail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
