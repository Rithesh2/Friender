//
//  ProfileViewController.swift
//  CustomLoginDemo
//
//  Created by Divya Kunisetty on 11/12/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
  
    @IBOutlet weak var userNameLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = self.tabBarController  as! CustomTabBarController
        let fUser = tbvc.fUser
        let userFullName = fUser!.firstName + " " + fUser!.lastName
        userNameLabel.text = userFullName
 

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

