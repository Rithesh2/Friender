//
//  CardViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 11/24/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase


class CardViewController: UIViewControllerX {
    
    @IBOutlet weak var bio: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var Joke: UITextField!
    @IBOutlet weak var threeWords: UITextField!
    @IBOutlet weak var animal: UITextField!
    @IBOutlet weak var card: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    let cornerRadius = 30
    var divisor: CGFloat!
    var index = 1
    var fUser: MyUser? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tbvc = self.tabBarController  as! CustomTabBarController
        self.card.layer.cornerRadius = CGFloat(self.cornerRadius)
        // self.card.layer.shadowColor = UIColor.init(red: 101/255, green: 168/255, blue: 196/255, alpha: 1).cgColor
        
        self.card.layer.shadowColor = UIColor.black.cgColor
        self.card.layer.shadowOpacity = 1
        self.card.layer.shadowOffset = .zero
        self.card.layer.shadowRadius = 10
        self.card.layer.shadowPath = UIBezierPath(roundedRect: self.card.bounds, cornerRadius: CGFloat(self.cornerRadius)).cgPath
        
        self.card.layer.shouldRasterize = true
        self.card.layer.rasterizationScale = UIScreen.main.scale
        fUser = tbvc.fUser
        divisor = (view.frame.width / 2) / 0.261//0.61 is the radians for 35 degrees
        self.findFirstName(uid: self.fUser!.matches[0]) { (fN) in
            var fullName = fN + " "
            self.findLastName(uid: self.fUser!.matches[0]) { (lastName) in
                fullName += lastName
                self.nameLabel.text = fullName
                
                self.findAnimal(uid: self.fUser!.matches[0]){(animal) in
                    self.animal.text = animal
                    
                 //   self.findBio(uid: self.fUser!.mat, completion: <#T##(String) -> Void#>)
                }
                
            }
        }
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        let delay = 0.5
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        let scale = min(100/abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        
        
        if sender.state == UIGestureRecognizer.State.ended{
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.5, animations: { card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                })
                card.alpha = 0
                // card.center = CGPoint(x: view.center.x + 300, y: card.center.y + 75)
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.getNewCard()
                }
                return
            }
            else if card.center.x > (view.frame.width-75){
                UIView.animate(withDuration: 0.5, animations: { card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0 
                })
                
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.getNewCard()
                }
                return
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.card.center = self.view.center
                self.card.transform = .identity
            })
        }
    }
    
    func getNewCard(){
        
        UIView.animate(withDuration: 0.7, animations: {
            let match = self.fUser!.matches[self.index]
            var fullName = ""
            self.findFirstName(uid: match) { (fN) in
                fullName = fN + " "
                self.findLastName(uid: match) { (lastName) in
                    fullName += lastName
                    self.nameLabel.text = fullName
                    if(self.index == self.fUser!.matches.count - 1)
                    {
                        self.index = 0
                    }
                    else{
                        self.index = self.index + 1
                    }
                }
                
            }
            
            self.card.center = self.view.center
            self.card.alpha = 1
            self.card.transform = .identity
        })}
    
    @IBAction func refreshButton(_ sender: Any) {
        let db = Firestore.firestore()
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
            
            db.collection("users").document(self.fUser!.uid).getDocument { (document, error) in
                if error == nil{
                    //Check the document exists
                    if document != nil && document!.exists == true{
                        let documentData = document!.data()
                        if(documentData?["pastmatches"] != nil)
                        {
                            var pastMatches = documentData?["pastmatches"] as! Array<String>
                            
                            self.findMatches(uid: self.fUser!.uid) { (matches) in
                                let pastMatchesSet = Set(pastMatches)
                                let matchesSet = Set(matches)
                                if(!matchesSet.isSubset(of: pastMatchesSet))
                                {
                                    pastMatches.append(contentsOf: matches)
                                }

                                self.fUser!.pastMatches = pastMatches
                                db.collection("users").document(self.fUser!.uid).updateData(["pastmatches": self.fUser!.pastMatches]){ (error) in
                                    if error != nil{
                                        print("error")
                                    }
                                }
                            }
                        }
                        else
                        {
                            self.findMatches(uid: self.fUser!.uid) { (matches) in
                                self.fUser!.pastMatches = matches
                                db.collection("users").document(self.fUser!.uid).updateData(["pastmatches": self.fUser!.pastMatches]){ (error) in
                                    if error != nil{
                                        print("error")
                                    }
                                }
                            }
                            
                        }
                        
                        db.collection("users").getDocuments() { (querySnapshot, err) in
                            if let err = err {
                                print("Error getting documents: \(err)")
                                return
                            }
                            /*
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
 */
                            self.generateNewMatches(arr: self.fUser!.uid, dic: users) { (newMatches, isNewMatch) in
                                self.fUser!.matches = newMatches
                                db.collection("users").document(self.fUser!.uid).updateData(["matches": self.fUser!.matches]){ (error) in
                                    if error != nil{
                                        print("error")
                                    }
                                }
                                
                            }
                            /*
                             for x in matches{
                             self.findFirstName(uid: x) { (fN) in
                             print(fN)
                             }
                             }
                             */
                            
                            
                        }
                    }
                    else{
                        print("error")
                    }
                }
                
            }
            
            
            
            /*
            self.generateNewMatches(arr: self.fUser!.uid, dic: users) { (newMatches, isNewMatch) in
                let matches = newMatches
                self.fUser!.matches = matches
                db.collection("users").document(self.fUser!.uid).updateData(["matches": self.fUser!.matches]){ (error) in
                    if error != nil{
                        print("error")
                    }
                }
                //self.transitionToHome(user: self.fUser!)
            }
            */
            //self.transitionToHome(user: self.fUser!)
            
        }
    }
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation  before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
