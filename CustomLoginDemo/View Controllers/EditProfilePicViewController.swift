//
//  EditProfilePicViewController.swift
//  CustomLoginDemo
//
//  Created by Rithesh Kannan on 11/27/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class EditProfilePicViewController: UIViewController {

    @IBOutlet weak var pictureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
  
        
        
        func picture(){
            pictureLabel.isUserInteractionEnabled = true
            
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(presentPicker))
        pictureLabel.addGestureRecognizer(tapGesture)
    }


    @objc func presentPicker(){
        let picker = UIImagePickerController()
        
        picker.sourceType  = .photoLibrary
        self.present(picker, animated: true, completion: nil)
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
