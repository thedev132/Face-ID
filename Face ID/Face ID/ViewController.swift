import LocalAuthentication
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
           let button = UIButton()
           button.setTitle("Try Face ID", for: .normal)
           button.backgroundColor = .link
           button.setTitleColor(.white, for: .normal)
           button.layer.cornerRadius = 12
           button.layer.masksToBounds = true
           button.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
           button.frame = CGRect(x: 85, y: 430, width: 200, height: 100)
           button.addTarget(self, action: #selector(tappedFaceId), for: .touchUpInside)
        view.addSubview(button)
}
    
    @objc func tappedFaceId() {
        addFaceId()
    }
    
    
    func  addFaceId() {
        guard #available(iOS 8, *) else {
           return print("not supported")
        }
        let context = LAContext()
            var error: NSError?
        
            guard context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics , error: &error) else {
            return print(error?.localizedDescription ?? "error")
        
        }
            
            let reason = "Face ID Auth"
            
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics ,localizedReason: reason) { (isAuthorized, error)  in
                guard isAuthorized == true else {
                    return print(error?.localizedDescription ?? "error")
                }
                print("success")
        }
    }
}

