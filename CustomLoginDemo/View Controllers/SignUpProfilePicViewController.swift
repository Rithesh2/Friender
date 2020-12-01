//
//  ProfilePicViewController.swift
//  CustomLoginDemo
//
//  Created by Divya Kunisetty on 11/22/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase
import FirebaseStorage

class SignUpProfilePictureViewController: UIViewControllerX {
    var fUser: MyUser? = nil
    @IBOutlet weak var uploadPFPLabel: UILabel!
    @IBOutlet weak var profilePicture: UIImageView!
    var image: UIImage? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        profilePicture.layer.cornerRadius = 40
        profilePicture.clipsToBounds = true
        uploadPFPLabel.text = ""
        let titleText = "Please Select Your Profile Picture"
        uploadPFPLabel.textColor = UIColor.init(red: 101/255, green: 168/255, blue: 196/255, alpha: 1)
        var charIndex = 0.0
        for letter in titleText{
            Timer.scheduledTimer(withTimeInterval: 0.08 * charIndex, repeats: false) { (timer) in
                self.uploadPFPLabel.text?.append(letter)
            }
             charIndex += 1
        }
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Continue", style: .plain, target: self, action: #selector(moveToNext))
        

       }
    @objc private func moveToNext() {
        // our custom stuff
        let db = Firestore.firestore()
        guard let imageSelected = self.image else{
                    print("avatar is nil")
                    return
                }
                guard let imageData = imageSelected.jpegData(compressionQuality: 0.4) else{
                    return
                }
        let storageRef = Storage.storage().reference(forURL: "gs://customlogindemo-2cc6b.appspot.com")
                            let storageProfileRef = storageRef.child("profile").child(fUser!.uid)
                            let metadata = StorageMetadata()
                            metadata.contentType = "image/jpeg"
                            storageProfileRef.putData(imageData, metadata: metadata, completion: {
                                (StorageMetadata, error) in
                                if error != nil{
                                    print(error?.localizedDescription)
                                    return
                                }
                                
                                storageProfileRef.downloadURL(completion: { (url,error) in
                                    if let metaImageUrl = url?.absoluteString{
                                        db.collection("users").document(self.fUser!.uid).updateData(["imageurl": metaImageUrl]){ (error) in
                                            if error != nil{
                                                print("error")
                                            }
                                        }
                                    }
                                })
                            })

        let vc = storyboard?.instantiateViewController(withIdentifier: "bioController") as! BioViewController
        vc.fUser = self.fUser
        navigationController?.pushViewController(vc, animated: true)
       }
    
    @IBAction func editProfilePicture(_ sender: Any) {

        let picker = UIImagePickerController()

        

        picker.sourceType  = .photoLibrary

        picker.allowsEditing = true

        picker.delegate = self

        self.present(picker, animated: true, completion: nil)
        
        

    }

    

}

extension SignUpProfilePictureViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate{

    

    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {

        if let imageSelected = info[UIImagePickerController.InfoKey.editedImage] as? UIImage{
            image = imageSelected
            profilePicture.image = imageSelected

        }

        

        if let imageOriginal = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{
            image = imageOriginal
            profilePicture.image = imageOriginal

        }

        

        picker.dismiss(animated: true, completion: nil)

    }

}
