//
//  NewMatchesViewController.swift
//  CustomLoginDemo
//
//  Created by Divya Kunisetty on 11/12/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//
/*
import UIKit

<<<<<<< HEAD
class NewMatchesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var table: UITableView!
    
    //var fUser = MyUser(uid: "")
        override func viewDidLoad() {
            super.viewDidLoad()
            table.delegate = self
            table.dataSource = self
    
    func tableView(<#T##tableView: UITableView##UITableView#>, numberOfRowsInSection: <#T##Int#>)
        return 3
=======
class NewMatchesViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = self.tabBarController  as! CustomTabBarController
        let fUser = tbvc.fUser
        print("newMatches" + fUser!.uid)
>>>>>>> ffdbac909bb93e09046b09b28240952515759cf3
        // Do any additional setup after loading the view.
    }
    func tableView(tableView: UITableView,)
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
import UIKit

class TableTableViewCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var titleLabel01: UILabel!
    @IBOutlet weak var textLabel02: UILabel!
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
*/
 
 // I commented out the previous code just in case, and I wrote my code below.
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
