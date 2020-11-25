//
//  BioViewController.swift
//  CustomLoginDemo
//
//  Created by Divya Kunisetty on 11/22/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class BioViewController: UIViewController {
    @IBOutlet weak var enterBioLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        enterBioLabel.text = ""
        let titleText = "please enter your bio"
        var charIndex = 0.0
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.enterBioLabel.text?.append(letter)
            }
             charIndex += 1
        }

       }

}






