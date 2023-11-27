import UIKit

class UploadPhotoVC: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var btn_Update: UIButton!
    
    var selectedImg: UIImage?
    
    var sendData:((UIImage) -> Void)?
    
    // MARK: Override func:
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.isNavigationBarHidden = true
        
        setUpView()
        
        addGasture()
    }
    
    // MARK: Actions:
    
    @IBAction func click_backbtn(_ sender: UIButton) {
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func click_Update(_ sender: Any) {
        if let img = selectedImg {
            sendData!(img)
            navigationController?.popViewController(animated: true)
        }
    }
    
    @objc func imageTapped() {
        
        imagePicker()
        print("Image tapped!")
    }
    
    // MARK: Function:
    
    private func setUpView() {
        
        imageView.layer.borderWidth = 0.5
        imageView.layer.borderColor = UIColor.lightGray.cgColor
        
        btn_Update.layer.shadowColor = UIColor.black.cgColor
        btn_Update.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        btn_Update.layer.shadowOffset = CGSize(width: -3.0, height: 0)
        btn_Update.layer.shadowOpacity = 0.5
        btn_Update.layer.shadowRadius = 10
    }
    
    private func imagePicker() {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true)
    }
    
    private func addGasture(){
        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.imageTapped))
        imageView.addGestureRecognizer(tapGestureRecognizer)
        imageView.isUserInteractionEnabled = true
    }
}

// MARK: Image Picker Delegate:

extension UploadPhotoVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        let selectedImage = info[.originalImage] as? UIImage
        
        imageView.image = selectedImage
        
        selectedImg = selectedImage
        
        dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        dismiss(animated: true)
    }
}

