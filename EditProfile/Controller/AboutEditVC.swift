import UIKit

class AboutEditVC: UIViewController {
    
    @IBOutlet weak var aboutView: UIView!
    @IBOutlet weak var btn_Update: UIButton!
    @IBOutlet weak var TextView: UITextView!
    @IBOutlet weak var bgView: UIView!
    
    var aboutText: String = ""
    var sendData:((String) -> Void)?
    
    // MARK: Override func:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        TextView.text = aboutText
        
        setUpView()
        
        addGasture()
    }
    
    // MARK: Actions:
    
    @IBAction func click_BackBtn(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func click_Update(_ sender: UIButton) {
        
        sendData!(TextView.text)
        
        navigationController?.popViewController(animated: true)
    }
    
    @objc func viewTapped() {
        view.endEditing(true)
    }
    
    // MARK: Function:
    
    private func addGasture(){
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.viewTapped))
        bgView.addGestureRecognizer(tapGestureRecognizer)
        bgView.isUserInteractionEnabled = true
    }
    
    private func setUpView() {
        aboutView.layer.borderWidth = 0.5
        aboutView.layer.borderColor = UIColor.lightGray.cgColor
        
        btn_Update.layer.shadowColor = UIColor.black.cgColor
        btn_Update.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        btn_Update.layer.shadowOffset = CGSize(width: -3.0, height: 0)
        btn_Update.layer.shadowOpacity = 0.5
        btn_Update.layer.shadowRadius = 10
    }
}
