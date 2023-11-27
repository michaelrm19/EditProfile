import UIKit

class NameEditVC: UIViewController {
    
    @IBOutlet weak var fistNameView: UIView!
    @IBOutlet weak var lastNameView: UIView!
    @IBOutlet weak var btn_Update: UIButton!
    @IBOutlet weak var fistNameField: UITextField!
    @IBOutlet weak var lastNameField: UITextField!
    @IBOutlet weak var bgView: UIView!
    
    var fistNameText: String = ""
    var lastNameText: String = ""
    
    var sendFistData:((String) -> Void)?
    var sendLastData:((String) -> Void)?
    
    // MARK: Override func:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        fistNameField.text = fistNameText
        lastNameField.text = lastNameText
        
        setUpView()
        
        addGasture()
    }
    
    // MARK: Actions:
    
    @IBAction func click_backbtn(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func click_Update(_ sender: UIButton) {
        
        sendFistData!(fistNameField.text ?? "")
        sendLastData!(lastNameField.text ?? "")
        
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
        fistNameView.layer.borderWidth = 0.5
        fistNameView.layer.borderColor = UIColor.lightGray.cgColor
        
        lastNameView.layer.borderWidth = 0.5
        lastNameView.layer.borderColor = UIColor.lightGray.cgColor
        
        btn_Update.layer.shadowColor = UIColor.black.cgColor
        btn_Update.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        btn_Update.layer.shadowOffset = CGSize(width: -3.0, height: 0)
        btn_Update.layer.shadowOpacity = 0.5
        btn_Update.layer.shadowRadius = 10
    }
}
