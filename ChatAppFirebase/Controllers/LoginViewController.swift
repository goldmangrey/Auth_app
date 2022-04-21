import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore
import FirebaseDatabase

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
    }
    
    func setUpElements() {
        errorLabel.alpha = 0
        
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }

    @IBAction func loginPressed(_ sender: Any) {
        
        let email = emailTextField.text!
        let password = passwordTextField.text!
        
        // Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if error != nil {
                self.errorLabel.text = error?.localizedDescription
                self.errorLabel.alpha = 1
            } else {
                let uid = Auth.auth().currentUser?.uid
                Database.database().reference().child("users").child(uid!).observe(.value, with: { snapshot in
                    
                    print(snapshot)
                    
                }, withCancel: nil)

                self.transitionToHome()
            }
        }
        
    }
    
    func transitionToHome() {
        
        let homeVC = storyboard?.instantiateViewController(withIdentifier: Constants.Storyboard.homeViewController) as? HomeViewController
        
        
        navigationController?.pushViewController(homeVC!, animated: true)
    }
    
}
