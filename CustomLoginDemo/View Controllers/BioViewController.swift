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

class BioViewController: UIViewControllerX {
    @IBOutlet weak var enterBioLabel: UILabel!
    @IBOutlet weak var bioTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleTextField(bioTextField)
        enterBioLabel.text = ""
        let titleText = "Please Enter Your Bio"
        enterBioLabel.textColor = UIColor.init(red: 101/255, green: 168/255, blue: 196/255, alpha: 1)
        var charIndex = 0.0
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.08 * charIndex, repeats: false) { (timer) in
                self.enterBioLabel.text?.append(letter)
            }
             charIndex += 1
        }

       }

}






