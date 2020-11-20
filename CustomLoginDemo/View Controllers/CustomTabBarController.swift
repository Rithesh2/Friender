//
//  CustomTabBarController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 11/14/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit

class CustomTabBarController: UITabBarController {
    var fUser: MyUser? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        print(fUser!.uid)

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

