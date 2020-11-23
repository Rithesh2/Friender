//
//  ProfilePicViewController.swift
//  CustomLoginDemo
//
//  Created by Divya Kunisetty on 11/22/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class ProfilePicViewController: UIViewController {

    @IBOutlet weak var uploadProfilePicLabel: UILabel!
    
    var str = "please upload your profile picture"
    override func viewDidLoad(){
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target:self, action: #selector(onClickView))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc
    func onClickView() {
        for i in str{
            uploadProfilePicLabel.text! += "\(i)"
            RunLoop.current.run(until: Date()+0.12)
        }
    }

}
