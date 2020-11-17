
 import UIKit
 import FirebaseAuth
 import FirebaseFirestore
 import Firebase

 class NewMatchesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    var fUser: MyUser? = nil
    
    @IBOutlet weak var tableView: UITableView!
    //how do we pass our user names? (question)

    
    //how do we pass our user pictures? (question)
    //let userPictures = []
    
    
    //how do we pass our user contacts? (question)
    //let contacts = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let tbvc = self.tabBarController  as! CustomTabBarController
        fUser = tbvc.fUser
        //register our custom cell for a tableview
       self.tableView.register(UINib(nibName: "CustomUITableViewCell", bundle: nil), forCellReuseIdentifier: "customUser")

    }
    
    func tableView(  _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //we want number of users update automatically
        return 3
    }

    func tableView(  _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customUser", for: indexPath) as! CustomTableViewCell
       // let cell = tableView.dequeueReusableCell(withIdentifier: "customUser", for: indexPath)
        //can we say "cell.userPicture.image"? (question)
        //cell.userPicture.image = userPictures[indexPath.row]
        
        cell.userName.text = fUser!.firstName + " " + fUser!.lastName
        cell.userContact.text = "510-49494"
        //cell.textLabel?.text = "Hi"
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = "510-00-45"
        print(contact)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
 }
    
class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userContact: UILabel!
    @IBOutlet weak var userPicture: UIImageView!
}
