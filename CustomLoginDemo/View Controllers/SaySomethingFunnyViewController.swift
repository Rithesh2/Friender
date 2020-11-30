
//
//  SaySomethingFunnyViewController.swift
//  CustomLoginDemo
//
//  Created by Divya Kunisetty on 11/28/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class SaySomethingFunnyViewController: UIViewControllerX {
    var fUser: MyUser? = nil
    @IBOutlet weak var SaySomethingFunnyLabel: UILabel!
    
    @IBOutlet weak var EnterAnswer: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Utilities.styleTextField(EnterAnswer)
        SaySomethingFunnyLabel.text = ""
        let titleText = "Tell Us a Joke"
        SaySomethingFunnyLabel.textColor = UIColor.init(red: 101/255, green: 168/255, blue: 196/255, alpha: 1)
        var charIndex = 0.0
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.08 * charIndex, repeats: false) { (timer) in
                self.SaySomethingFunnyLabel.text?.append(letter)
            }
             charIndex += 1
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(moveToNext))


       }
        // Do any additional setup after loading the view.
    @objc private func moveToNext() {
        // our custom stuff

        let vc = storyboard?.instantiateViewController(withIdentifier: "SelectAnimalViewController") as! SelectAnimalViewController
        vc.fUser = self.fUser
        navigationController?.pushViewController(vc, animated: true)
       }
  
       }
   

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


