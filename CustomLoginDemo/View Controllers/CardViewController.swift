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
    
    @IBOutlet weak var profilePic: UIImageView!
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
                    
                    self.findBio(uid: self.fUser!.matches[0]){ (bio) in self.bio.text = bio
                        
                        self.findJoke(uid:self.fUser!.matches[0]){ (joke) in self.Joke.text = joke
                            
                            self.findContact(uid:self.fUser!.matches[0]){ (contact) in self.contact.text = contact
                                
                                self.findThree(uid:self.fUser!.matches[0]){ (three) in self.threeWords.text = three
                                    
                                    self.findImage(uid:self.fUser!.matches[0]){(image) in
                                        self.profilePic.setImage(from: image)
                                        
                                        self.findPreferences(uid: self.fUser!.matches[0]){
                                            (preferences) in
                                            if(preferences[0] == "music")

                                                    {

                                                        p1.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[0] == "swimming")

                                                    {

                                                        p1.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[0] == "hiking")

                                                    {

                                                        p1.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[0] == "gardening")

                                                    {

                                                        p1.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[0] == "biking")

                                                    {

                                                        p1.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[0] == "painting")

                                                    {

                                                        p1.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[0] == "technology")

                                                    {

                                                        p1.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[0] == "dancing")

                                                    {

                                                        p1.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[0] == "eating")

                                                    {

                                                        p1.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[0] == "camping")

                                                    {

                                                        p1.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[0] == "sports")

                                                    {

                                                        p1.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[0] == "photography")

                                                    {

                                                        p1.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[0] == "basketball")

                                                    {

                                                        p1.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(fUser!.preferences[0] == "reading")

                                                    {

                                                        p1.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[0] == "running")

                                                    {

                                                        p1.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    

                                                    

                                                    if(preferences[1] == "music")

                                                    {

                                                        p2.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[1] == "swimming")

                                                    {

                                                        p2.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[1] == "hiking")

                                                    {

                                                        p2.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[1] == "gardening")

                                                    {

                                                        p2.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[1] == "biking")

                                                    {

                                                        p2.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[1] == "painting")

                                                    {

                                                        p2.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[1] == "technology")

                                                    {

                                                        p2.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[1] == "dancing")

                                                    {

                                                        p2.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[1] == "eating")

                                                    {

                                                        p2.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[1] == "camping")

                                                    {

                                                        p2.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[1] == "sports")

                                                    {

                                                        p2.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[1] == "photography")

                                                    {

                                                        p2.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[1] == "basketball")

                                                    {

                                                        p2.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[1] == "reading")

                                                    {

                                                        p2.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[1] == "running")

                                                    {

                                                        p2.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    

                                                    if(preferences[2] == "music")

                                                    {

                                                        p3.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[2] == "swimming")

                                                    {

                                                        p3.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[2] == "hiking")

                                                    {

                                                        p3.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[2] == "gardening")

                                                    {

                                                        p3.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[2] == "biking")

                                                    {

                                                        p3.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[2] == "painting")

                                                    {

                                                        p3.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[2] == "technology")

                                                    {

                                                        p3.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[2] == "dancing")

                                                    {

                                                        p3.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[2] == "eating")

                                                    {

                                                        p3.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[2] == "camping")

                                                    {

                                                        p3.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[2] == "sports")

                                                    {

                                                        p3.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(fUser!.preferences[2] == "photography")

                                                    {

                                                        p3.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[2] == "basketball")

                                                    {

                                                        p3.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[2] == "reading")

                                                    {

                                                        p3.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[2] == "running")

                                                    {

                                                        p3.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    if(preferences[3] == "music")

                                                    {

                                                        p4.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[3] == "swimming")

                                                    {

                                                        p4.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[3] == "hiking")

                                                    {

                                                        p4.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[3] == "gardening")

                                                    {

                                                        p4.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[3] == "biking")

                                                    {

                                                        p4.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[3] == "painting")

                                                    {

                                                        p4.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[3] == "technology")

                                                    {

                                                        p4.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[3] == "dancing")

                                                    {

                                                        p4.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[3] == "eating")

                                                    {

                                                        p4.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[3] == "camping")

                                                    {

                                                        p4.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[3] == "sports")

                                                    {

                                                        p4.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[3] == "photography")

                                                    {

                                                        p4.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[3] == "basketball")

                                                    {

                                                        p4.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[3] == "reading")

                                                    {

                                                        p4.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[3] == "running")

                                                    {

                                                        p4.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    if(preferences[4] == "music")

                                                    {

                                                        p5.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[4] == "swimming")

                                                    {

                                                        p5.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[4] == "hiking")

                                                    {

                                                        p5.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[4] == "gardening")

                                                    {

                                                        p5.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[4] == "biking")

                                                    {

                                                        p5.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[4] == "painting")

                                                    {

                                                        p5.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[4] == "technology")

                                                    {

                                                        p5.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[4] == "dancing")

                                                    {

                                                        p5.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[4] == "eating")

                                                    {

                                                        p5.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[4] == "camping")

                                                    {

                                                        p5.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[4] == "sports")

                                                    {

                                                        p5.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[4] == "photography")

                                                    {

                                                        p5.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[4] == "basketball")

                                                    {

                                                        p5.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[4] == "reading")

                                                    {

                                                        p5.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[4] == "running")

                                                    {

                                                        p5.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                    }

                                                    if(preferences[5] == "music")

                                                    {

                                                        p6.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                    }

                                                    else if(preferences[5] == "swimming")

                                                    {

                                                        p6.image = UIImage(named: "11-512")

                                                    }

                                                    else if(preferences[5] == "hiking")

                                                    {

                                                        p6.image = UIImage(named: "45242-200")

                                                    }

                                                    else if(preferences[5] == "gardening")

                                                    {

                                                        p6.image = UIImage(named: "planting-1444113-1222073")

                                                    }

                                                    else if(preferences[5] == "biking")

                                                    {

                                                        p6.image = UIImage(named: "15900-200")

                                                    }

                                                    else if(preferences[5] == "painting")

                                                    {

                                                        p6.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                    }

                                                    else if(preferences[5] == "technology")

                                                    {

                                                        p6.image = UIImage(named: "img_543487")

                                                    }

                                                    else if(preferences[5] == "dancing")

                                                    {

                                                        p6.image = UIImage(named: "3310358-200")

                                                    }

                                                    else if(preferences[5] == "eating")

                                                    {

                                                        p6.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                    }

                                                    else if(preferences[5] == "camping")

                                                    {

                                                        p6.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                    }

                                                    else if(preferences[5] == "sports")

                                                    {

                                                        p6.image = UIImage(named: "3107821-200-1")

                                                    }

                                                    else if(preferences[5] == "photography")

                                                    {

                                                        p6.image = UIImage(named: "img_469468")

                                                    }

                                                    else if(preferences[5] == "basketball")

                                                    {

                                                        p6.image = UIImage(named: "81412-200")

                                                    }

                                                    else if(preferences[5] == "reading")

                                                    {

                                                        p6.image = UIImage(named: "130304")

                                                    }

                                                    else if(preferences[5] == "running")

                                                    {

                                                        p6.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

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
                    self.findAnimal(uid: match){(animal) in
                        self.animal.text = animal
                        
                        self.findBio(uid: match){ (bio) in self.bio.text = bio
                            
                            self.findJoke(uid:match){ (joke) in self.Joke.text = joke
                                
                                self.findContact(uid:match){ (contact) in self.contact.text = contact
                                    
                                    self.findThree(uid:match){ (three) in self.threeWords.text = three
                                        
                                        self.findImage(uid:match){(image) in
                                            self.profilePic.setImage(from: image)
                                              
                                            self.findPreferences(uid: match){
                                                (preferences) in
                                                if(preferences[0] == "music")

                                                        {

                                                            p1.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                        }

                                                        else if(preferences[0] == "swimming")

                                                        {

                                                            p1.image = UIImage(named: "11-512")

                                                        }

                                                        else if(preferences[0] == "hiking")

                                                        {

                                                            p1.image = UIImage(named: "45242-200")

                                                        }

                                                        else if(preferences[0] == "gardening")

                                                        {

                                                            p1.image = UIImage(named: "planting-1444113-1222073")

                                                        }

                                                        else if(preferences[0] == "biking")

                                                        {

                                                            p1.image = UIImage(named: "15900-200")

                                                        }

                                                        else if(preferences[0] == "painting")

                                                        {

                                                            p1.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                        }

                                                        else if(preferences[0] == "technology")

                                                        {

                                                            p1.image = UIImage(named: "img_543487")

                                                        }

                                                        else if(preferences[0] == "dancing")

                                                        {

                                                            p1.image = UIImage(named: "3310358-200")

                                                        }

                                                        else if(preferences[0] == "eating")

                                                        {

                                                            p1.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                        }

                                                        else if(preferences[0] == "camping")

                                                        {

                                                            p1.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                        }

                                                        else if(preferences[0] == "sports")

                                                        {

                                                            p1.image = UIImage(named: "3107821-200-1")

                                                        }

                                                        else if(preferences[0] == "photography")

                                                        {

                                                            p1.image = UIImage(named: "img_469468")

                                                        }

                                                        else if(preferences[0] == "basketball")

                                                        {

                                                            p1.image = UIImage(named: "81412-200")

                                                        }

                                                        else if(fUser!.preferences[0] == "reading")

                                                        {

                                                            p1.image = UIImage(named: "130304")

                                                        }

                                                        else if(preferences[0] == "running")

                                                        {

                                                            p1.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                        }

                                                        

                                                        

                                                        if(preferences[1] == "music")

                                                        {

                                                            p2.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                        }

                                                        else if(preferences[1] == "swimming")

                                                        {

                                                            p2.image = UIImage(named: "11-512")

                                                        }

                                                        else if(preferences[1] == "hiking")

                                                        {

                                                            p2.image = UIImage(named: "45242-200")

                                                        }

                                                        else if(preferences[1] == "gardening")

                                                        {

                                                            p2.image = UIImage(named: "planting-1444113-1222073")

                                                        }

                                                        else if(preferences[1] == "biking")

                                                        {

                                                            p2.image = UIImage(named: "15900-200")

                                                        }

                                                        else if(preferences[1] == "painting")

                                                        {

                                                            p2.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                        }

                                                        else if(preferences[1] == "technology")

                                                        {

                                                            p2.image = UIImage(named: "img_543487")

                                                        }

                                                        else if(preferences[1] == "dancing")

                                                        {

                                                            p2.image = UIImage(named: "3310358-200")

                                                        }

                                                        else if(preferences[1] == "eating")

                                                        {

                                                            p2.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                        }

                                                        else if(preferences[1] == "camping")

                                                        {

                                                            p2.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                        }

                                                        else if(preferences[1] == "sports")

                                                        {

                                                            p2.image = UIImage(named: "3107821-200-1")

                                                        }

                                                        else if(preferences[1] == "photography")

                                                        {

                                                            p2.image = UIImage(named: "img_469468")

                                                        }

                                                        else if(preferences[1] == "basketball")

                                                        {

                                                            p2.image = UIImage(named: "81412-200")

                                                        }

                                                        else if(preferences[1] == "reading")

                                                        {

                                                            p2.image = UIImage(named: "130304")

                                                        }

                                                        else if(preferences[1] == "running")

                                                        {

                                                            p2.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                        }

                                                        

                                                        if(preferences[2] == "music")

                                                        {

                                                            p3.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                        }

                                                        else if(preferences[2] == "swimming")

                                                        {

                                                            p3.image = UIImage(named: "11-512")

                                                        }

                                                        else if(preferences[2] == "hiking")

                                                        {

                                                            p3.image = UIImage(named: "45242-200")

                                                        }

                                                        else if(preferences[2] == "gardening")

                                                        {

                                                            p3.image = UIImage(named: "planting-1444113-1222073")

                                                        }

                                                        else if(preferences[2] == "biking")

                                                        {

                                                            p3.image = UIImage(named: "15900-200")

                                                        }

                                                        else if(preferences[2] == "painting")

                                                        {

                                                            p3.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                        }

                                                        else if(preferences[2] == "technology")

                                                        {

                                                            p3.image = UIImage(named: "img_543487")

                                                        }

                                                        else if(preferences[2] == "dancing")

                                                        {

                                                            p3.image = UIImage(named: "3310358-200")

                                                        }

                                                        else if(preferences[2] == "eating")

                                                        {

                                                            p3.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                        }

                                                        else if(preferences[2] == "camping")

                                                        {

                                                            p3.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                        }

                                                        else if(preferences[2] == "sports")

                                                        {

                                                            p3.image = UIImage(named: "3107821-200-1")

                                                        }

                                                        else if(fUser!.preferences[2] == "photography")

                                                        {

                                                            p3.image = UIImage(named: "img_469468")

                                                        }

                                                        else if(preferences[2] == "basketball")

                                                        {

                                                            p3.image = UIImage(named: "81412-200")

                                                        }

                                                        else if(preferences[2] == "reading")

                                                        {

                                                            p3.image = UIImage(named: "130304")

                                                        }

                                                        else if(preferences[2] == "running")

                                                        {

                                                            p3.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                        }

                                                        if(preferences[3] == "music")

                                                        {

                                                            p4.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                        }

                                                        else if(preferences[3] == "swimming")

                                                        {

                                                            p4.image = UIImage(named: "11-512")

                                                        }

                                                        else if(preferences[3] == "hiking")

                                                        {

                                                            p4.image = UIImage(named: "45242-200")

                                                        }

                                                        else if(preferences[3] == "gardening")

                                                        {

                                                            p4.image = UIImage(named: "planting-1444113-1222073")

                                                        }

                                                        else if(preferences[3] == "biking")

                                                        {

                                                            p4.image = UIImage(named: "15900-200")

                                                        }

                                                        else if(preferences[3] == "painting")

                                                        {

                                                            p4.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                        }

                                                        else if(preferences[3] == "technology")

                                                        {

                                                            p4.image = UIImage(named: "img_543487")

                                                        }

                                                        else if(preferences[3] == "dancing")

                                                        {

                                                            p4.image = UIImage(named: "3310358-200")

                                                        }

                                                        else if(preferences[3] == "eating")

                                                        {

                                                            p4.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                        }

                                                        else if(preferences[3] == "camping")

                                                        {

                                                            p4.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                        }

                                                        else if(preferences[3] == "sports")

                                                        {

                                                            p4.image = UIImage(named: "3107821-200-1")

                                                        }

                                                        else if(preferences[3] == "photography")

                                                        {

                                                            p4.image = UIImage(named: "img_469468")

                                                        }

                                                        else if(preferences[3] == "basketball")

                                                        {

                                                            p4.image = UIImage(named: "81412-200")

                                                        }

                                                        else if(preferences[3] == "reading")

                                                        {

                                                            p4.image = UIImage(named: "130304")

                                                        }

                                                        else if(preferences[3] == "running")

                                                        {

                                                            p4.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                        }

                                                        if(preferences[4] == "music")

                                                        {

                                                            p5.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                        }

                                                        else if(preferences[4] == "swimming")

                                                        {

                                                            p5.image = UIImage(named: "11-512")

                                                        }

                                                        else if(preferences[4] == "hiking")

                                                        {

                                                            p5.image = UIImage(named: "45242-200")

                                                        }

                                                        else if(preferences[4] == "gardening")

                                                        {

                                                            p5.image = UIImage(named: "planting-1444113-1222073")

                                                        }

                                                        else if(preferences[4] == "biking")

                                                        {

                                                            p5.image = UIImage(named: "15900-200")

                                                        }

                                                        else if(preferences[4] == "painting")

                                                        {

                                                            p5.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                        }

                                                        else if(preferences[4] == "technology")

                                                        {

                                                            p5.image = UIImage(named: "img_543487")

                                                        }

                                                        else if(preferences[4] == "dancing")

                                                        {

                                                            p5.image = UIImage(named: "3310358-200")

                                                        }

                                                        else if(preferences[4] == "eating")

                                                        {

                                                            p5.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                        }

                                                        else if(preferences[4] == "camping")

                                                        {

                                                            p5.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                        }

                                                        else if(preferences[4] == "sports")

                                                        {

                                                            p5.image = UIImage(named: "3107821-200-1")

                                                        }

                                                        else if(preferences[4] == "photography")

                                                        {

                                                            p5.image = UIImage(named: "img_469468")

                                                        }

                                                        else if(preferences[4] == "basketball")

                                                        {

                                                            p5.image = UIImage(named: "81412-200")

                                                        }

                                                        else if(preferences[4] == "reading")

                                                        {

                                                            p5.image = UIImage(named: "130304")

                                                        }

                                                        else if(preferences[4] == "running")

                                                        {

                                                            p5.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                        }

                                                        if(preferences[5] == "music")

                                                        {

                                                            p6.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                                                        }

                                                        else if(preferences[5] == "swimming")

                                                        {

                                                            p6.image = UIImage(named: "11-512")

                                                        }

                                                        else if(preferences[5] == "hiking")

                                                        {

                                                            p6.image = UIImage(named: "45242-200")

                                                        }

                                                        else if(preferences[5] == "gardening")

                                                        {

                                                            p6.image = UIImage(named: "planting-1444113-1222073")

                                                        }

                                                        else if(preferences[5] == "biking")

                                                        {

                                                            p6.image = UIImage(named: "15900-200")

                                                        }

                                                        else if(preferences[5] == "painting")

                                                        {

                                                            p6.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                                                        }

                                                        else if(preferences[5] == "technology")

                                                        {

                                                            p6.image = UIImage(named: "img_543487")

                                                        }

                                                        else if(preferences[5] == "dancing")

                                                        {

                                                            p6.image = UIImage(named: "3310358-200")

                                                        }

                                                        else if(preferences[5] == "eating")

                                                        {

                                                            p6.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                                                        }

                                                        else if(preferences[5] == "camping")

                                                        {

                                                            p6.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                                                        }

                                                        else if(preferences[5] == "sports")

                                                        {

                                                            p6.image = UIImage(named: "3107821-200-1")

                                                        }

                                                        else if(preferences[5] == "photography")

                                                        {

                                                            p6.image = UIImage(named: "img_469468")

                                                        }

                                                        else if(preferences[5] == "basketball")

                                                        {

                                                            p6.image = UIImage(named: "81412-200")

                                                        }

                                                        else if(preferences[5] == "reading")

                                                        {

                                                            p6.image = UIImage(named: "130304")

                                                        }

                                                        else if(preferences[5] == "running")

                                                        {

                                                            p6.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                                                        }
                                            }
                                        
                                        if(self.index == self.fUser!.matches.count - 1)
                                        {
                                            self.index = 0
                                        }
                                        else{
                                            self.index = self.index + 1
                                        }
                                            }
                                        }
                                        
                                    
                            }
                        }
                    }
                    
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
