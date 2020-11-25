//
//  PreferencesViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 11/15/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class PreferencesViewController: UIViewController {
    var fUser: MyUser? = nil
    var music_selected = false
    var swimming_selected = false
    var hiking_selected = false
    var gardening_selected = false
    var biking_selected = false
    var painting_selected = false
    var technology_selected = false
    var dancing_selected = false
    var eating_selected = false
    var camping_selected = false
    var sports_selected = false
    var photography_selected = false
    var basketball_selected = false
    var reading_selected = false
    var running_selected = false
    
    @IBOutlet weak var selectPreferencesLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        selectPreferencesLabel.text = ""
        let titleText = "please select six items"
        var charIndex = 0.0
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.1 * charIndex, repeats: false) { (timer) in
                self.selectPreferencesLabel.text?.append(letter)
            }
             charIndex += 1
        }

       }

    @IBOutlet weak var errorLabel: UILabel!
    //override func viewDidLoad() {
        //super.viewDidLoad()
        // Do any additional setup after loading the view.
    //}
    func checkForOptionsLimit() -> Bool
    {
        let optionLimit = 6
        print(fUser!.preferences.count)
        return fUser!.preferences.count < optionLimit
    }
    
    func appendToPreferencesList(preference: String)
    {
            fUser!.preferences.append(preference)
            print(fUser!.preferences)

    }
    
    func deleteFromPreferencesList(preference: String)
    {
            if let index =  fUser!.preferences.firstIndex(of: preference) {
                fUser!.preferences.remove(at: index)
            }
            print(fUser!.preferences)
        /*
        if (!checkForOptionsLimit())
        {
            errorLabel.text = "You have selected more than 6 options. Please deselect one."
            errorLabel.isHidden = false
        }
        else{
            errorLabel.isHidden = true
        }
 */
    }
    
    @IBAction func continueButton(_ sender: Any) {
        
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
            self.transitionToHome(user: self.fUser!)
               
            }
 
    }
    
    func transitionToHome(user: MyUser){
      

        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVCTabBar") as? CustomTabBarController
        homeViewController?.fUser = user
        self.view.window?.rootViewController = homeViewController
        self.view.window?.makeKeyAndVisible()

    }
        
    @IBAction func musicButton(_ sender: Any) {
 
        guard let button = sender as? UIButton else { return }
        if !music_selected
        {
            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = false
                appendToPreferencesList(preference: "music")
                button.tintColor = .yellow
                music_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
        }
        else{
            deleteFromPreferencesList(preference: "music")
            button.tintColor = .blue
            music_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
    
    @IBAction func swimmingButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !swimming_selected
        {
            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "swimming")
                button.tintColor = .yellow
                swimming_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
           
        }
        else{
            deleteFromPreferencesList(preference: "swimming")
            button.tintColor = .blue
            swimming_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
        
    @IBAction func hikingButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !hiking_selected
        {
            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "hiking")
                button.tintColor = .yellow
                hiking_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
       
        }
        else{
            deleteFromPreferencesList(preference: "hiking")
            button.tintColor = .blue
            hiking_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
    
    @IBAction func gardeningButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !gardening_selected
        {
            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "gardening")
                button.tintColor = .yellow
                gardening_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
         
        }
        else{
            deleteFromPreferencesList(preference: "gardening")
            button.tintColor = .blue
            gardening_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
    @IBAction func bikingButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !biking_selected
        {
            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "biking")
                button.tintColor = .yellow
                biking_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
           
        }
        else{
            deleteFromPreferencesList(preference: "biking")
            button.tintColor = .blue
            biking_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
    @IBAction func paintingButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !painting_selected
        {
            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "painting")
                button.tintColor = .yellow
                painting_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
        
        }
        else{
            deleteFromPreferencesList(preference: "painting")
            button.tintColor = .blue
            painting_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }

    @IBAction func technologyButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !technology_selected
        {
            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "technology")
                button.tintColor = .yellow
                technology_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
                
            }
            
      
        }
        else{
            deleteFromPreferencesList(preference: "technology")
            button.tintColor = .blue
            technology_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
    @IBAction func dancingButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !dancing_selected
        {
    
            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "dancing")
                button.tintColor = .yellow
                dancing_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
          
        }
        else{
            deleteFromPreferencesList(preference: "dancing")
            button.tintColor = .blue
            dancing_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
    @IBAction func eatingButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !eating_selected
        {

            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "eating")
                button.tintColor = .yellow
                eating_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
          
        }
        else{
            deleteFromPreferencesList(preference: "eating")
            button.tintColor = .blue
            eating_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
    @IBAction func campingButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !camping_selected
        {

            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "camping")
                button.tintColor = .yellow
                camping_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
      
        }
        else{
            deleteFromPreferencesList(preference: "camping")
            button.tintColor = .blue
            camping_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
    

    @IBAction func sportsButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !sports_selected
        {

            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "sports")
                button.tintColor = .yellow
                sports_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
    
        }
        else{
            deleteFromPreferencesList(preference: "sports")
            button.tintColor = .blue
            sports_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }
    

    @IBAction func photographyButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !photography_selected
        {

            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "photography")
                button.tintColor = .yellow
                photography_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
          
        }
        else{
            deleteFromPreferencesList(preference: "photography")
            button.tintColor = .blue
            photography_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }

    @IBAction func basketBallButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !basketball_selected
        {

            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "basketball")
                button.tintColor = .yellow
                basketball_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            
  
        }
        else{
            deleteFromPreferencesList(preference: "basketball")
            button.tintColor = .blue
            basketball_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }

    @IBAction func readingButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !reading_selected
        {
  
            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "reading")
                button.tintColor = .yellow
                reading_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            

        }
        else{
            deleteFromPreferencesList(preference: "reading")
            button.tintColor = .blue
            reading_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
        }
    }

    @IBAction func runningButton(_ sender: Any) {
        
        guard let button = sender as? UIButton else { return }
        if !running_selected
        {

            if(checkForOptionsLimit())
            {
                errorLabel.isHidden = true
                appendToPreferencesList(preference: "running")
                button.tintColor = .yellow
                running_selected = true
            }
            else
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            

        }
        else{
            deleteFromPreferencesList(preference: "running")
            button.tintColor = .blue
            running_selected = false
            if(!checkForOptionsLimit())
            {
                errorLabel.text = "You have selected more than 6 options. Please deselect one."
                errorLabel.isHidden = false
            }
            else{
                errorLabel.isHidden = true
            }
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

}

