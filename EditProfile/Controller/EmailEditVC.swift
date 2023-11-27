import UIKit

class EmailEditVC: UIViewController {
    
    @IBOutlet weak var emailView: UIView!
    @IBOutlet weak var btn_Update: UIButton!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    var emailText: String = ""
    var sendData:((String) -> Void)?
    
    // MARK: Override func:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        emailField.text = emailText
        
        setUpView()
        
        addGasture()
    }
    
    // MARK: Actions:
    
    @IBAction func click_BackBtn(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func click_Update(_ sender: UIButton) {
        
        sendData!(emailField.text ?? "")
        
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
        emailView.layer.borderWidth = 0.5
        emailView.layer.borderColor = UIColor.lightGray.cgColor
        
        btn_Update.layer.shadowColor = UIColor.black.cgColor
        btn_Update.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        btn_Update.layer.shadowOffset = CGSize(width: -3.0, height: 0)
        btn_Update.layer.shadowOpacity = 0.5
        btn_Update.layer.shadowRadius = 10
    }
}
