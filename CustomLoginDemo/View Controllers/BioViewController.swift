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
    var fUser: MyUser? = nil
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
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(moveToNext))


       }
    @objc private func moveToNext() {
        // our custom stuff
       /*
        let db = Firestore.firestore()
        db.collection("users").document(fUser!.uid).updateData(["preferences": fUser!.preferences]){ (error) in
                    if error != nil{
                        print("error")
                        }
                }
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            }
            
            var users: [String: [String]] = [:]
            for document in querySnapshot!.documents {
                
                print(document.data()["preferences"]!)
                let preferences = document.data()["preferences"] as! Array<String>
                let ID = document.data()["uid"] as! String
                users[ID] = preferences
 
         
                // print(users)
                
                //print(document.data())
                //print(document.get("preferences")!)
            }
            let matches = self.big(arr: self.fUser!.uid, dic: users)
            for x in matches{
                self.findFirstName(uid: x) { (fN) in
                    print(fN)
                }
            }
            self.fUser!.matches = matches
            db.collection("users").document(self.fUser!.uid).updateData(["matches": self.fUser!.matches]){ (error) in
                        if error != nil{
                            print("error")
                            }
                    }
            //self.transitionToHome(user: self.fUser!)
              
            }*/
        let vc = storyboard?.instantiateViewController(withIdentifier: "threeWords") as! ThreeWordsViewController
        vc.fUser = self.fUser
        navigationController?.pushViewController(vc, animated: true)
       }
       
    
    func transitionToHome(user: MyUser){
      

        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVCTabBar") as? CustomTabBarController
        homeViewController?.fUser = user
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()

    }

}






