//
//  SignUpViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 7/26/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class SignUpViewController: UIViewControllerX {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!

    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.init(red: 255/255, green: 254/255, blue: 242/255, alpha: 1)
        // Do any additional setup after loading the view.
        setUpElements()
    }
    
    func setUpElements(){
        errorLabel.alpha = 0
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
    }
    
    //Check the fields and validate that the data is correct. if everything is correct, this method returns nil. Otherwise it returns the error message.
    func validateFields() -> String? {
        //Check that all fields are filled in
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
             return "Please fill in all fields."
        }
        let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        if Utilities.isPasswordValid(cleanedPassword) == false{
            return "Please make sure your password is at least 8 characters, contains a special character, and a number."
        }
        return nil
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func signUpTapped(_ sender: Any) {
 
        //Validate the fields
        let error = validateFields()
        if error != nil{
            //There was an error
           showError(message: error!)
        }
        else
        {
            //Create cleaned versions of the data
            let firstName = firstNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let lastName = lastNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
                //Create the user
           
            Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
                //Check for errors
                if err != nil{
                    //There was an error creating the user
                    self.showError(message: "Error creating user")
                }
                else
                {
                    //User was created successfully, now store the first and last name in database
                    let db = Firestore.firestore()
                    /*
                    db.collection("users").addDocument(data: ["firstname": firstName, "lastname": lastName, "uid": result!.user.uid]) { (error) in
                        if error != nil{
                            self.showError(message: "Error saving user data")
                        }
                    }
 */
                    db.collection("users").document(result!.user.uid).setData(["firstname": firstName, "lastname": lastName, "uid": result!.user.uid]){ (error) in
                        if error != nil{
                            self.showError(message: "Error saving user data")
                        }
                        
                        
                    }
                    self.transitionToPreferences(uid: result!.user.uid)
                    //Transition to the home screen
                    
                    
                }
            }
         
     
        }
    
        
       
    
    }
    
    func showError(message:String)
    {
      
        errorLabel.text = message
        errorLabel.alpha = 1
    }
    
    func transitionToPreferences(uid: String){
        let pFVC = self.storyboard?.instantiateViewController(identifier: "preferencesController") as? PreferencesViewController
        let db = Firestore.firestore()
         db.collection("users").document(uid).getDocument { (document, error) in
             if error == nil{
                 //Check the document exists
                 if document != nil && document!.exists == true{
                     let documentData = document!.data()
                     let firstName = documentData?["firstname"] as! String
                     let lastName = documentData?["lastname"] as! String
                    pFVC?.fUser = MyUser(uid: uid, firstName: firstName, lastName: lastName, preferences: [], matches: [])
                    self.navigationController?.pushViewController(pFVC!, animated: true)
                 }
                 else{
                     print("error")
                 }
             }
         }


    }
    
    func transitionToHome(uid: String){
      

        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVCTabBar") as? CustomTabBarController
 
}
}

