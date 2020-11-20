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
    var music_selected = true
    var swimming_selected = true
    var hiking_selected = true
    var gardening_selected = true
    var biking_selected = true
    var painting_selected = true
    var technology_selected = true
    var dancing_selected = true
    var eating_selected = true
    var camping_selected = true
    var sports_selected = true
    var photography_selected = true
    var basketball_selected = true
    var reading_selected = true
    var running_selected = true
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    func checkForOptionsLimit() -> Bool
    {
        let optionLimit = 20
        return fUser!.preferences.count <= optionLimit
    }
    
    func appendToPreferencesList(preference: String)
    {
        if(checkForOptionsLimit())
        {
            fUser!.preferences.append(preference)
            print(fUser!.preferences)
        }
        else
        {
            errorLabel.text = "You have selected more than 6 options. Please deselect one."
            errorLabel.isHidden = false
        }
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
        appendToPreferencesList(preference: "music")
        guard let button = sender as? UIButton else { return }
        if music_selected
        {
            button.tintColor = .yellow
            music_selected = false
        }
        else{
            button.tintColor = .blue
            music_selected = true
        }
    }
    
    @IBAction func swimmingButton(_ sender: Any) {
        appendToPreferencesList(preference: "swimming")
        guard let button = sender as? UIButton else { return }
        if swimming_selected
        {
            button.tintColor = .yellow
            swimming_selected = false
        }
        else{
            button.tintColor = .blue
            swimming_selected = true
        }
    }
        
    @IBAction func hikingButton(_ sender: Any) {
        appendToPreferencesList(preference: "hiking")
        guard let button = sender as? UIButton else { return }
        if hiking_selected
        {
            button.tintColor = .yellow
            hiking_selected = false
        }
        else{
            button.tintColor = .blue
            hiking_selected = true
        }
    }
    
    @IBAction func gardeningButton(_ sender: Any) {
        appendToPreferencesList(preference: "gardening")
        guard let button = sender as? UIButton else { return }
        if gardening_selected
        {
            button.tintColor = .yellow
            gardening_selected = false
        }
        else{
            button.tintColor = .blue
            gardening_selected = true
        }
    }
    @IBAction func bikingButton(_ sender: Any) {
        appendToPreferencesList(preference: "biking")
        guard let button = sender as? UIButton else { return }
        if biking_selected
        {
            button.tintColor = .yellow
            biking_selected = false
        }
        else{
            button.tintColor = .blue
            biking_selected = true
        }
    }
    @IBAction func paintingButton(_ sender: Any) {
        appendToPreferencesList(preference: "painting")
        guard let button = sender as? UIButton else { return }
        if painting_selected
        {
            button.tintColor = .yellow
            painting_selected = false
        }
        else{
            button.tintColor = .blue
            painting_selected = true
        }
    }

    @IBAction func technologyButton(_ sender: Any) {
        appendToPreferencesList(preference: "technology")
        guard let button = sender as? UIButton else { return }
        if technology_selected
        {
            button.tintColor = .yellow
            technology_selected = false
        }
        else{
            button.tintColor = .blue
            technology_selected = true
        }
    }
    @IBAction func dancingButton(_ sender: Any) {
        appendToPreferencesList(preference: "dancing")
        guard let button = sender as? UIButton else { return }
        if dancing_selected
        {
            button.tintColor = .yellow
            dancing_selected = false
        }
        else{
            button.tintColor = .blue
            dancing_selected = true
        }
    }
    @IBAction func eatingButton(_ sender: Any) {
        appendToPreferencesList(preference: "eating")
        guard let button = sender as? UIButton else { return }
        if eating_selected
        {
            button.tintColor = .yellow
            eating_selected = false
        }
        else{
            button.tintColor = .blue
            eating_selected = true
        }
    }
    @IBAction func campingButton(_ sender: Any) {
        appendToPreferencesList(preference: "camping")
        guard let button = sender as? UIButton else { return }
        if camping_selected
        {
            button.tintColor = .yellow
            camping_selected = false
        }
        else{
            button.tintColor = .blue
            camping_selected = true
        }
    }
    

    @IBAction func sportsButton(_ sender: Any) {
        appendToPreferencesList(preference: "sports")
        guard let button = sender as? UIButton else { return }
        if sports_selected
        {
            button.tintColor = .yellow
            sports_selected = false
        }
        else{
            button.tintColor = .blue
            sports_selected = true
        }
    }
    

    @IBAction func photographyButton(_ sender: Any) {
        appendToPreferencesList(preference: "photography")
        guard let button = sender as? UIButton else { return }
        if photography_selected
        {
            button.tintColor = .yellow
            photography_selected = false
        }
        else{
            button.tintColor = .blue
            photography_selected = true
        }
    }

    @IBAction func basketBallButton(_ sender: Any) {
        appendToPreferencesList(preference: "basketball")
        guard let button = sender as? UIButton else { return }
        if basketball_selected
        {
            button.tintColor = .yellow
            basketball_selected = false
        }
        else{
            button.tintColor = .blue
            basketball_selected = true
        }
    }

    @IBAction func readingButton(_ sender: Any) {
        appendToPreferencesList(preference: "reading")
        guard let button = sender as? UIButton else { return }
        if reading_selected
        {
            button.tintColor = .yellow
            reading_selected = false
        }
        else{
            button.tintColor = .blue
            reading_selected = true
        }
    }

    @IBAction func runningButton(_ sender: Any) {
        appendToPreferencesList(preference: "running")
        guard let button = sender as? UIButton else { return }
        if running_selected
        {
            button.tintColor = .yellow
            running_selected = false
        }
        else{
            button.tintColor = .blue
            running_selected = true
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
