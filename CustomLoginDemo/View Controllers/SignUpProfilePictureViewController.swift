//
//  SignUpProfilePictureViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 11/22/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit

class SignUpProfilePictureViewController: UIViewController {
    var imagePicker: UIImagePickerController
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = true
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        // Do any additional setup after loading the view.
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

extension SignUpViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    private func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let pickedImage = info[UIImagePickerController.InfoKey.editedImage.rawValue] as? UIImage {
            self.profileImageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    
}

