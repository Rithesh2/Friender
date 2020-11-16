 import UIKit

 class NewMatchesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    //how do we pass our user names? (question)
    let userNames = MyUser(uid: "")
    
    //how do we pass our user pictures? (question)
    let userPictures = []
    
    
    //how do we pass our user contacts? (question)
    let contacts = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //register our custom cell for a tableview
        self.tableView.register(UINib(nibName: "CustomUITableViewCell", bundle: nil), forCellReuseIdentifier: "customUser")

    }
    
    func tableView(  tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //we want number of users update automatically
        return userNames.count
    }

    func tableView(  tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =
            tableView.dequeueReusableCell(withIdentifier: "customUser", for: indexPath) as! CustomTableViewCell
        //can we say "cell.userPicture.image"? (question)
        cell.userPicture.image = userPictures[indexPath.row]
        cell.userName.text = userName[indexPath.row]
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = contacts[indexPath.row]
        print(contact)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }
 }
    
class CustomTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var userPicture: UIImageView!
}
