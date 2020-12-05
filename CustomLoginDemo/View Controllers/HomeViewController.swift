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

class HomeViewController: UIViewControllerX {


    var match: String = ""
      
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var p2: UIImageView!
    @IBOutlet weak var p3: UIImageView!
    
    @IBOutlet weak var p6: UIImageView!
    @IBOutlet weak var p5: UIImageView!
    @IBOutlet weak var p4: UIImageView!
    @IBOutlet weak var p1: UIImageView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var threeWords: UITextField!
    @IBOutlet weak var contact: UITextField!
    @IBOutlet weak var Joke: UITextField!
    @IBOutlet weak var bio: UITextField!
    @IBOutlet weak var animal: UITextField!
    @IBOutlet weak var userNameText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var fullName = ""
        self.findFirstName(uid: match) { (fN) in
            fullName = fN + " "
            self.findLastName(uid: self.match) { (lastName) in
                fullName += lastName
                self.nameLabel.text = fullName
                self.findAnimal(uid: self.match){(animal) in
                    self.animal.text = animal
                    
                    self.findBio(uid: self.match){ (bio) in self.bio.text = bio
                        
                        self.findJoke(uid:self.match){ (joke) in self.Joke.text = joke
                            
                            self.findContact(uid:self.match){ (contact) in self.contact.text = contact
                                
                                self.findThree(uid:self.match){ (three) in self.threeWords.text = three
                                    
                                    self.findImage(uid:self.match){(image) in
                                        self.profilePic.setImage(from: image)
                                          
                                        self.findPreferences(uid: self.match){ [self]
                                            (preferences) in
                                            if(preferences[0] == "music")

                                                    {

                                                self.p1.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[0] == "swimming")

                                                    {

                                                        self.p1.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[0] == "hiking")

                                                    {

                                                        self.p1.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[0] == "gardening")

                                                    {

                                                        self.p1.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[0] == "biking")

                                                    {

                                                        self.p1.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[0] == "painting")

                                                    {

                                                        self.p1.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[0] == "technology")

                                                    {

                                                        self.p1.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[0] == "dancing")

                                                    {

                                                        self.p1.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[0] == "eating")

                                                    {

                                                        self.p1.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[0] == "camping")

                                                    {

                                                        self.p1.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[0] == "sports")

                                                    {

                                                        self.p1.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[0] == "photography")

                                                    {

                                                        self.p1.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[0] == "basketball")

                                                    {

                                                        self.p1.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[0] == "reading")

                                                    {

                                                        self.p1.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[0] == "running")

                                                    {

                                                        self.p1.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    

                                                    

                                                    if(preferences[1] == "music")

                                                    {

                                                        self.p2.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[1] == "swimming")

                                                    {

                                                        self.p2.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[1] == "hiking")

                                                    {

                                                        self.p2.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[1] == "gardening")

                                                    {

                                                        self.p2.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[1] == "biking")

                                                    {

                                                        self.p2.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[1] == "painting")

                                                    {

                                                        self.p2.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[1] == "technology")

                                                    {

                                                        self.p2.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[1] == "dancing")

                                                    {

                                                        self.p2.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[1] == "eating")

                                                    {

                                                        self.p2.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[1] == "camping")

                                                    {

                                                        self.p2.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[1] == "sports")

                                                    {

                                                        self.p2.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[1] == "photography")

                                                    {

                                                        self.p2.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[1] == "basketball")

                                                    {

                                                        self.p2.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[1] == "reading")

                                                    {

                                                        self.p2.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[1] == "running")

                                                    {

                                                        self.p2.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    

                                                    if(preferences[2] == "music")

                                                    {

                                                        self.p3.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[2] == "swimming")

                                                    {

                                                        self.p3.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[2] == "hiking")

                                                    {

                                                        self.p3.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[2] == "gardening")

                                                    {

                                                        self.p3.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[2] == "biking")

                                                    {

                                                        self.p3.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[2] == "painting")

                                                    {

                                                        self.p3.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[2] == "technology")

                                                    {

                                                        self.p3.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[2] == "dancing")

                                                    {

                                                        self.p3.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[2] == "eating")

                                                    {

                                                        self.p3.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[2] == "camping")

                                                    {

                                                        self.p3.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[2] == "sports")

                                                    {

                                                        self.p3.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[2] == "photography")

                                                    {

                                                        self.p3.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[2] == "basketball")

                                                    {

                                                        self.p3.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[2] == "reading")

                                                    {

                                                        self.p3.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[2] == "running")

                                                    {

                                                        self.p3.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    if(preferences[3] == "music")

                                                    {

                                                        self.p4.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[3] == "swimming")

                                                    {

                                                        self.p4.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[3] == "hiking")

                                                    {

                                                        self.p4.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[3] == "gardening")

                                                    {

                                                        self.p4.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[3] == "biking")

                                                    {

                                                        self.p4.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[3] == "painting")

                                                    {

                                                        self.p4.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[3] == "technology")

                                                    {

                                                        self.p4.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[3] == "dancing")

                                                    {

                                                        self.p4.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[3] == "eating")

                                                    {

                                                        self.p4.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[3] == "camping")

                                                    {

                                                        self.p4.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[3] == "sports")

                                                    {

                                                        self.p4.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[3] == "photography")

                                                    {

                                                        self.p4.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[3] == "basketball")

                                                    {

                                                        self.p4.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[3] == "reading")

                                                    {

                                                        self.p4.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[3] == "running")

                                                    {

                                                        self.p4.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    if(preferences[4] == "music")

                                                    {

                                                        self.p5.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[4] == "swimming")

                                                    {

                                                        self.p5.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[4] == "hiking")

                                                    {

                                                        self.p5.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[4] == "gardening")

                                                    {

                                                        self.p5.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[4] == "biking")

                                                    {

                                                        self.p5.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[4] == "painting")

                                                    {

                                                        self.p5.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[4] == "technology")

                                                    {

                                                        self.p5.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[4] == "dancing")

                                                    {

                                                        self.p5.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[4] == "eating")

                                                    {

                                                        self.p5.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[4] == "camping")

                                                    {

                                                        self.p5.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[4] == "sports")

                                                    {

                                                        self.p5.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[4] == "photography")

                                                    {

                                                        self.p5.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[4] == "basketball")

                                                    {

                                                        self.p5.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[4] == "reading")

                                                    {

                                                        self.p5.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[4] == "running")

                                                    {

                                                        self.self.p5.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    if(preferences[5] == "music")

                                                    {

                                                        self.self.p6.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[5] == "swimming")

                                                    {

                                                        self.self.p6.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[5] == "hiking")

                                                    {

                                                        self.self.p6.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[5] == "gardening")

                                                    {

                                                        self.self.p6.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[5] == "biking")

                                                    {

                                                        self.self.p6.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[5] == "painting")

                                                    {

                                                        self.self.p6.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[5] == "technology")

                                                    {

                                                        self.self.p6.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[5] == "dancing")

                                                    {

                                                        self.self.p6.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[5] == "eating")

                                                    {

                                                        self.self.p6.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[5] == "camping")

                                                    {

                                                        self.self.p6.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[5] == "sports")

                                                    {

                                                        self.self.p6.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[5] == "photography")

                                                    {

                                                        self.self.p6.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[5] == "basketball")

                                                    {

                                                        self.self.p6.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[5] == "reading")

                                                    {

                                                        self.self.p6.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[5] == "running")

                                                    {

                                                        self.self.p6.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }
                                        }
                                    
                                
                                        }
                                    }
                                    
                                
                        }
                    }
                }
                
            }
            }
            
        }
        
      
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
          
       
        
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
        /*
         working code
     
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
         */
        
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

