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

class SignUpProfilePictureViewController: UIViewController {

    @IBOutlet weak var uploadPFPLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        uploadPFPLabel.text = ""
        let titleText = "please upload your profile picture"
        var charIndex = 0.0
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.uploadPFPLabel.text?.append(letter)
            }
             charIndex += 1
        }

       }

    

}
