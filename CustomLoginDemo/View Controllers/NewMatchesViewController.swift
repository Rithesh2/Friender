
import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class NewMatchesViewController: UIViewControllerX, UITableViewDataSource, UITableViewDelegate {
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
    self.findPastMatches(uid: fUser!.uid) { (pastMatches) in
        self.fUser!.pastMatches = pastMatches
    }
      self.tableView.register(UINib(nibName: "CustomUITableViewCell", bundle: nil), forCellReuseIdentifier: "customUser")

   }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated) // No need for semicolon
        print(fUser!.pastMatches)
        self.findPastMatches(uid: fUser!.uid) { (pastMatches) in
            self.fUser!.pastMatches = pastMatches
            self.tableView.reloadData()
      
        }
        
    }
   
   func tableView(  _ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //we want number of users update automatically
    return fUser!.pastMatches.count
   }

   func tableView(  _ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "customUser", for: indexPath) as! CustomTableViewCell
      // let cell = tableView.dequeueReusableCell(withIdentifier: "customUser", for: indexPath)
       //can we say "cell.userPicture.image"? (question)
       //cell.userPicture.image = userPictures[indexPath.row]
       let match = fUser!.pastMatches[indexPath.row]
       var fullName = ""
       self.findFirstName(uid: match) { (fN) in
           fullName = fN + " "
           self.findLastName(uid: match) { (lastName) in
               fullName += lastName
               cell.userName.text = fullName
               cell.userContact.text = "510-49494"
               cell.userName.isHidden = false
           }
           
       }
      
       
       
       //cell.textLabel?.text = "Hi"
       return cell
       
   }
   
   func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
      // tableView.deselectRow(at: indexPath, animated: true)
       print(fUser!.pastMatches[indexPath.row])
       performSegue(withIdentifier: "matchSegue", sender: self)
      // homeController?.match = fUser!.matches[indexPath.row]
    

   }
   
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
       if segue.identifier == "matchSegue" {
           let vc: HomeViewController = segue.destination as! HomeViewController
           vc.match = fUser!.pastMatches[(tableView.indexPathForSelectedRow?.row)!]
           tableView.deselectRow(at: tableView.indexPathForSelectedRow!, animated: true)
       }
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


