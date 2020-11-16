//
//  PreferencesViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 11/15/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit

class PreferencesViewController: UIViewController {
    var fUser: MyUser? = nil
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
    
    
    @IBAction func musicButton(_ sender: Any) {
        appendToPreferencesList(preference: "music")
    }
    
    @IBAction func swimmingButton(_ sender: Any) {
        appendToPreferencesList(preference: "swimming")
    }
    @IBAction func hikingButton(_ sender: Any) {
        appendToPreferencesList(preference: "hiking")
    }
    @IBAction func gardeningButton(_ sender: Any) {
        appendToPreferencesList(preference: "gardening")
    }
    @IBAction func bikingButton(_ sender: Any) {
        appendToPreferencesList(preference: "biking")
    }
    @IBAction func paintingButton(_ sender: Any) {
        appendToPreferencesList(preference: "painting")
    }
    @IBAction func technologyButton(_ sender: Any) {
        appendToPreferencesList(preference: "technology")
    }
    @IBAction func dancingButton(_ sender: Any) {
        appendToPreferencesList(preference: "dancing")
    }
    @IBAction func eatingButton(_ sender: Any) {
        appendToPreferencesList(preference: "eating")
    }
    @IBAction func campingButton(_ sender: Any) {
        appendToPreferencesList(preference: "camping")
    }
    @IBAction func sportsButton(_ sender: Any) {
        appendToPreferencesList(preference: "sports")
    }
    @IBAction func photographyButton(_ sender: Any) {
        appendToPreferencesList(preference: "photography")
    }
    @IBAction func basketBallButton(_ sender: Any) {
        appendToPreferencesList(preference: "basketball")
    }
    @IBAction func readingButton(_ sender: Any) {
        appendToPreferencesList(preference: "reading")
    }
    @IBAction func runningButton(_ sender: Any) {
        appendToPreferencesList(preference: "running")
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
