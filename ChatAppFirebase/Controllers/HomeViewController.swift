import UIKit
import Firebase
import FirebaseAuth

class HomeViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let user = [UserModel(login: "User login", email: "User email")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editNavigationBar()
    }
    
    func editNavigationBar() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
    }
    
    @objc func handleLogout() {
        do {
            try Auth.auth().signOut()
        } catch let logoutError {
            print(logoutError)
        }
        
        navigationController?.popToRootViewController(animated: true)
    }

}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.rowHeight = 80
        let cell = tableView.dequeueReusableCell(withIdentifier: "UserTableViewCell", for: indexPath) as! UserTableViewCell
        
        cell.userLogin.text = user[indexPath.row].login
        cell.userLogin.text = user[indexPath.row].email
        
        return cell
    }
    
}

struct UserModel{
    var login: String
    var email: String
}
