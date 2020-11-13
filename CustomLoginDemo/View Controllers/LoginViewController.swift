//
//  LoginViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 7/26/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        setUpElements()
    }
    func setUpElements()
    {
        errorLabel.alpha = 0
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    
    func validateFields() -> String? {
           //Check that all fields are filled in
           if emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
           {
                return "Please fill in all fields."
           }
        
           return nil
           
       }
  

    @IBAction func loginTapped(_ sender: Any) {
        //Validate Text Fields
        let error = validateFields()
        if error != nil{
            //There was an error
           showError(message: error!)
        }
        else
        {
        //Create cleaned versions of the text field
        let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //Signing in the user
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if (error != nil)
            {
                //Couldn't sign in
                self.errorLabel.text = error!.localizedDescription
                self.errorLabel.alpha = 1
            }
            else
            {
                print(result!.user.uid)
                self.transitionToHome(uid: result!.user.uid)
                
            }
        }
        }
        
    }
    func showError(message:String)
      {
        
          errorLabel.text = message
          errorLabel.alpha = 1
      }
    
      
    
    func transitionToHome(uid: String){
        let homeViewController = self.storyboard?.instantiateViewController(withIdentifier: "HomeVCTabBar") as? UITabBarController
       // homeViewController?.uid = uid
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
            
          //let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? HomeViewController
        //homeViewController?.uid = uid
        //view.window?.rootViewController = homeViewController
        //view.window?.makeKeyAndVisible()
     
       
      }
}
