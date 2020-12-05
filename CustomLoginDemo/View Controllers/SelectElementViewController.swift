//
//  SelectAnimalViewController.swift
//  CustomLoginDemo
//
//  Created by Divya Kunisetty on 11/28/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class SelectElementViewController: UIViewControllerX {
    var fUser: MyUser? = nil
    
    var earth_selected = false
    var fire_selected = false
    var water_selected = false
    var air_selected = false
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var earthB: UIButton!
    @IBOutlet weak var waterB: UIButton!
    @IBOutlet weak var airB: UIButton!
    @IBOutlet weak var fireB: UIButton!
    @IBOutlet weak var selectAnimalLabel: UILabel!
    
    @IBOutlet weak var enterAnswer: UITextField!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Utilities.styleTextField(enterAnswer)
        selectAnimalLabel.text = ""
        let titleText = "Choose an Element"
        selectAnimalLabel.textColor = UIColor.init(red: 101/255, green: 168/255, blue: 196/255, alpha: 1)
        var charIndex = 0.0
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.08 * charIndex, repeats: false) { (timer) in
                self.selectAnimalLabel.text?.append(letter)
            }
             charIndex += 1
        }
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(moveToNext))


       }
        // Do any additional setup after loading the view.
    @objc private func moveToNext() {

        // our custom stuff
        if(fUser!.Element == "")
        {
            errorLabel.text = "Please make sure to choose one Element"
            errorLabel.isHidden = false
        }
        else
        {
        let db = Firestore.firestore()
        db.collection("users").document(self.fUser!.uid).updateData(["Element": self.fUser!.Element]){ (error) in
                                                    if error != nil{
                                                        print("error")
                                                    }
                                                }

        let vc = storyboard?.instantiateViewController(withIdentifier: "selectPrefContact") as! SelectPrefContactViewController
        vc.fUser = self.fUser
        navigationController?.pushViewController(vc, animated: true)
        }
       }
  
    @IBAction func fireButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        if !fire_selected
        {
            fUser!.Element = "fire"
            button.tintColor = .systemTeal
            earthB.tintColor = .lightGray
            waterB.tintColor = .lightGray
            airB.tintColor = .lightGray
                fire_selected = true
            
        }
        else{
            fUser!.Element = ""
            button.tintColor = .lightGray
            fire_selected = false

        }
    }
    @IBAction func airButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        if !air_selected
        {
            fUser!.Element = "air"
            button.tintColor = .systemTeal
            earthB.tintColor = .lightGray
            waterB.tintColor = .lightGray
            fireB.tintColor = .lightGray
                air_selected = true
            
        }
        else{
            fUser!.Element = ""
            button.tintColor = .lightGray
            air_selected = false

        }
    }
    @IBAction func waterButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        if !water_selected
        {
            fUser!.Element = "water"
            button.tintColor = .systemTeal
            earthB.tintColor = .lightGray
            fireB.tintColor = .lightGray
            airB.tintColor = .lightGray
                water_selected = true
            
        }
        else{
            fUser!.Element = ""
            button.tintColor = .lightGray
            water_selected = false

        }
    }
    @IBAction func earthButton(_ sender: Any) {
        guard let button = sender as? UIButton else { return }
        if !earth_selected
        {
            fUser!.Element = "earth"
            button.tintColor = .systemTeal
            waterB.tintColor = .lightGray
            fireB.tintColor = .lightGray
            airB.tintColor = .lightGray
                water_selected = true
            
        }
        else{
            fUser!.Element = ""
            button.tintColor = .lightGray
            earth_selected = false

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


