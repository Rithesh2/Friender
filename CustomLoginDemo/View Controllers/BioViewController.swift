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
    
    var str = "please enter a short bio"
    override func viewDidLoad(){
        super.viewDidLoad()
        let gesture = UITapGestureRecognizer(target:self, action: #selector(onClickView))
        self.view.addGestureRecognizer(gesture)
    }
    
    @objc
    func onClickView() {
        for i in str{
            enterBioLabel.text! += "\(i)"
            RunLoop.current.run(until: Date()+0.12)
        }
    }

}






