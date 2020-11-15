//
//  NewMatchesViewController.swift
//  CustomLoginDemo
//
//  Created by Divya Kunisetty on 11/12/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit

class NewMatchesViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    @IBOutlet var table: UITableView!,
    
    //var fUser = MyUser(uid: "")
    override func viewDidLoad() {
        super.viewDidLoad()
        table.delegate = self
        table.dataSource = self
    
    tableView(<#T##tableView: UITableView##UITableView#>, numberOfRowsInSection: <#T##Int#>)
        return 3
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
