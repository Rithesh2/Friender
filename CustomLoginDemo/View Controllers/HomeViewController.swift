//
//  HomeViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 7/26/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class HomeViewController: UIViewController {

    @IBOutlet weak var homeText: UILabel!
    var uid = ""
    var firstName = ""
    var lastName = ""
      


    override func viewDidLoad() {
        super.viewDidLoad()
        homeText.setNeedsDisplay()
        print(firstName)
        
      
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
       
             setUpElements()
   
       
        
    }
    func setUpElements()
    {
        /*
        firstName = "Hello"
        print(firstName)
         let db = Firestore.firestore()
        let docRef = db.collection("users").document(uid)
        docRef.getDocument(source: .cache) { (document, error) in
          if let document = document {
            let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
            print("Cached document data: \(dataDescription)")
          } else {
            print("Document does not exist in cache")
          }
 
        }
    */
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).getDocument { (document, error) in
            if error == nil{
                //Check the document exists
                if document != nil && document!.exists == true{
                    let documentData = document!.data()
                    self.firstName = documentData?["firstname"] as! String
                    print(type(of: self.firstName))
                    print(self.firstName)
                    self.homeText.text = "Hello " + self.firstName
                }
                else{
                    print("error")
                }
            }
        }
 
        
        /*
        retrieveUsers()
        print("Hello")
        let text = "Hello"+firstName+" "+lastName
 */

     
          
          
    }
    /*
    func retrieveUsers()
    {
        
        let db = Firestore.firestore()
               db.collection("users").document(uid).getDocument { (document, error) in
                   if error == nil{
                       //Check the document exists
                       if document != nil && document!.exists == true{
                           let documentData = document!.data()
                           self.firstName = documentData?["firstname"] as! String
                           print(type(of: self.firstName))
                           print(self.firstName)
                        completion(.success)
                       }
                       else{
                           print("error")
                       }
                   }
               }
        
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
