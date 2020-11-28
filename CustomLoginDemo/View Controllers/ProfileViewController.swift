//

//  ProfileViewController.swift

//  CustomLoginDemo

//

//  Created by Divya Kunisetty on 11/12/20.

//  Copyright © 2020 Rohit Ravi. All rights reserved.

//



import UIKit



class ProfileViewController: UIViewControllerX {

  


    @IBOutlet weak var profilePicture: UIImageView!

    @IBOutlet weak var userNameLabel: UILabel!

    var fUser: MyUser? = nil

    override func viewDidLoad() {

        super.viewDidLoad()

        profilePicture.layer.cornerRadius = 40

        profilePicture.clipsToBounds = true

        let tbvc = self.tabBarController  as! CustomTabBarController

        fUser = tbvc.fUser

        let userFullName = fUser!.firstName + " " + fUser!.lastName

        userNameLabel.text = userFullName

 



        // Do any additional setup after loading the view.

    }

    

    @IBAction func editProfilePicture(_ sender: Any) {

        let picker = UIImagePickerController()

        

        picker.sourceType  = .photoLibrary

        picker.allowsEditing = true

        picker.delegate = self

        self.present(picker, animated: true, completion: nil)

    }

    

    @IBAction func editPreferenes(_ sender: Any) {

        performSegue(withIdentifier: "editPreferencesSegue", sender: self)

    }

    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "editPreferencesSegue" {

            let vc: EditPreferencesViewController = segue.destination as! EditPreferencesViewController

            vc.fUser = fUser



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



extension ProfileViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{

            profilePicture.image = imageSelected

        }

        

        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{

            profilePicture.image = imageOriginal

        }

        

        picker.dismiss(animated: true, completion: nil)

    }

}
