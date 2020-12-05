//

//  ProfileViewController.swift

//  CustomLoginDemo

//

//  Created by Divya Kunisetty on 11/12/20.

//  Copyright © 2020 Rohit Ravi. All rights reserved.

//



import UIKit
import FirebaseStorage


class ProfileViewController: UIViewControllerX {

  
    @IBOutlet weak var p6: UIImageView!
    @IBOutlet weak var p5: UIImageView!
    @IBOutlet weak var p4: UIImageView!
    @IBOutlet weak var p3: UIImageView!
    @IBOutlet weak var p2: UIImageView!
    @IBOutlet weak var p1: UIImageView!
    @IBOutlet weak var Bio: UILabel!
    @IBOutlet weak var Element: UILabel!
    @IBOutlet weak var Joke: UILabel!
    
    @IBOutlet weak var threeWords: UILabel!
    @IBOutlet weak var Animal: UILabel!
    
    @IBOutlet weak var profilePicture: UIImageView!

    @IBOutlet weak var userNameLabel: UILabel!

    var fUser: MyUser? = nil
    var image: UIImage? = nil

    override func viewDidLoad() {

        super.viewDidLoad()

        profilePicture.layer.cornerRadius = 40

        profilePicture.clipsToBounds = true

        let tbvc = self.tabBarController  as! CustomTabBarController

        fUser = tbvc.fUser

        let userFullName = fUser!.firstName + " " + fUser!.lastName

        userNameLabel.text = userFullName
        
        Animal.text = "Animal: " + fUser!.Animal
        Joke.text = "Joke: " + fUser!.Joke
        Bio.text = "Bio: " + fUser!.Bio
        Element.text = "Element: " + fUser!.Element
        threeWords.text = "Three Words: " + fUser!.ThreeWords
        profilePicture.setImage(from: fUser!.image)
        //profilePicture.load(url: URL(​fileURLWithPath: fUser!.image))
        if(fUser!.preferences[0] == "music")

                {

                    p1.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                }

                else if(fUser!.preferences[0] == "swimming")

                {

                    p1.image = UIImage(named: "11-512")

                }

                else if(fUser!.preferences[0] == "hiking")

                {

                    p1.image = UIImage(named: "45242-200")

                }

                else if(fUser!.preferences[0] == "gardening")

                {

                    p1.image = UIImage(named: "planting-1444113-1222073")

                }

                else if(fUser!.preferences[0] == "biking")

                {

                    p1.image = UIImage(named: "15900-200")

                }

                else if(fUser!.preferences[0] == "painting")

                {

                    p1.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                }

                else if(fUser!.preferences[0] == "technology")

                {

                    p1.image = UIImage(named: "img_543487")

                }

                else if(fUser!.preferences[0] == "dancing")

                {

                    p1.image = UIImage(named: "3310358-200")

                }

                else if(fUser!.preferences[0] == "eating")

                {

                    p1.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                }

                else if(fUser!.preferences[0] == "camping")

                {

                    p1.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                }

                else if(fUser!.preferences[0] == "sports")

                {

                    p1.image = UIImage(named: "3107821-200-1")

                }

                else if(fUser!.preferences[0] == "photography")

                {

                    p1.image = UIImage(named: "img_469468")

                }

                else if(fUser!.preferences[0] == "basketball")

                {

                    p1.image = UIImage(named: "81412-200")

                }

                else if(fUser!.preferences[0] == "reading")

                {

                    p1.image = UIImage(named: "130304")

                }

                else if(fUser!.preferences[0] == "running")

                {

                    p1.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                }

                

                

                if(fUser!.preferences[1] == "music")

                {

                    p2.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                }

                else if(fUser!.preferences[1] == "swimming")

                {

                    p2.image = UIImage(named: "11-512")

                }

                else if(fUser!.preferences[1] == "hiking")

                {

                    p2.image = UIImage(named: "45242-200")

                }

                else if(fUser!.preferences[1] == "gardening")

                {

                    p2.image = UIImage(named: "planting-1444113-1222073")

                }

                else if(fUser!.preferences[1] == "biking")

                {

                    p2.image = UIImage(named: "15900-200")

                }

                else if(fUser!.preferences[1] == "painting")

                {

                    p2.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                }

                else if(fUser!.preferences[1] == "technology")

                {

                    p2.image = UIImage(named: "img_543487")

                }

                else if(fUser!.preferences[1] == "dancing")

                {

                    p2.image = UIImage(named: "3310358-200")

                }

                else if(fUser!.preferences[1] == "eating")

                {

                    p2.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                }

                else if(fUser!.preferences[1] == "camping")

                {

                    p2.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                }

                else if(fUser!.preferences[1] == "sports")

                {

                    p2.image = UIImage(named: "3107821-200-1")

                }

                else if(fUser!.preferences[1] == "photography")

                {

                    p2.image = UIImage(named: "img_469468")

                }

                else if(fUser!.preferences[1] == "basketball")

                {

                    p2.image = UIImage(named: "81412-200")

                }

                else if(fUser!.preferences[1] == "reading")

                {

                    p2.image = UIImage(named: "130304")

                }

                else if(fUser!.preferences[1] == "running")

                {

                    p2.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                }

                

                if(fUser!.preferences[2] == "music")

                {

                    p3.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                }

                else if(fUser!.preferences[2] == "swimming")

                {

                    p3.image = UIImage(named: "11-512")

                }

                else if(fUser!.preferences[2] == "hiking")

                {

                    p3.image = UIImage(named: "45242-200")

                }

                else if(fUser!.preferences[2] == "gardening")

                {

                    p3.image = UIImage(named: "planting-1444113-1222073")

                }

                else if(fUser!.preferences[2] == "biking")

                {

                    p3.image = UIImage(named: "15900-200")

                }

                else if(fUser!.preferences[2] == "painting")

                {

                    p3.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                }

                else if(fUser!.preferences[2] == "technology")

                {

                    p3.image = UIImage(named: "img_543487")

                }

                else if(fUser!.preferences[2] == "dancing")

                {

                    p3.image = UIImage(named: "3310358-200")

                }

                else if(fUser!.preferences[2] == "eating")

                {

                    p3.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                }

                else if(fUser!.preferences[2] == "camping")

                {

                    p3.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                }

                else if(fUser!.preferences[2] == "sports")

                {

                    p3.image = UIImage(named: "3107821-200-1")

                }

                else if(fUser!.preferences[2] == "photography")

                {

                    p3.image = UIImage(named: "img_469468")

                }

                else if(fUser!.preferences[2] == "basketball")

                {

                    p3.image = UIImage(named: "81412-200")

                }

                else if(fUser!.preferences[2] == "reading")

                {

                    p3.image = UIImage(named: "130304")

                }

                else if(fUser!.preferences[2] == "running")

                {

                    p3.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                }

                if(fUser!.preferences[3] == "music")

                {

                    p4.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                }

                else if(fUser!.preferences[3] == "swimming")

                {

                    p4.image = UIImage(named: "11-512")

                }

                else if(fUser!.preferences[3] == "hiking")

                {

                    p4.image = UIImage(named: "45242-200")

                }

                else if(fUser!.preferences[3] == "gardening")

                {

                    p4.image = UIImage(named: "planting-1444113-1222073")

                }

                else if(fUser!.preferences[3] == "biking")

                {

                    p4.image = UIImage(named: "15900-200")

                }

                else if(fUser!.preferences[3] == "painting")

                {

                    p4.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                }

                else if(fUser!.preferences[3] == "technology")

                {

                    p4.image = UIImage(named: "img_543487")

                }

                else if(fUser!.preferences[3] == "dancing")

                {

                    p4.image = UIImage(named: "3310358-200")

                }

                else if(fUser!.preferences[3] == "eating")

                {

                    p4.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                }

                else if(fUser!.preferences[3] == "camping")

                {

                    p4.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                }

                else if(fUser!.preferences[3] == "sports")

                {

                    p4.image = UIImage(named: "3107821-200-1")

                }

                else if(fUser!.preferences[3] == "photography")

                {

                    p4.image = UIImage(named: "img_469468")

                }

                else if(fUser!.preferences[3] == "basketball")

                {

                    p4.image = UIImage(named: "81412-200")

                }

                else if(fUser!.preferences[3] == "reading")

                {

                    p4.image = UIImage(named: "130304")

                }

                else if(fUser!.preferences[3] == "running")

                {

                    p4.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                }

                if(fUser!.preferences[4] == "music")

                {

                    p5.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                }

                else if(fUser!.preferences[4] == "swimming")

                {

                    p5.image = UIImage(named: "11-512")

                }

                else if(fUser!.preferences[4] == "hiking")

                {

                    p5.image = UIImage(named: "45242-200")

                }

                else if(fUser!.preferences[4] == "gardening")

                {

                    p5.image = UIImage(named: "planting-1444113-1222073")

                }

                else if(fUser!.preferences[4] == "biking")

                {

                    p5.image = UIImage(named: "15900-200")

                }

                else if(fUser!.preferences[4] == "painting")

                {

                    p5.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                }

                else if(fUser!.preferences[4] == "technology")

                {

                    p5.image = UIImage(named: "img_543487")

                }

                else if(fUser!.preferences[4] == "dancing")

                {

                    p5.image = UIImage(named: "3310358-200")

                }

                else if(fUser!.preferences[4] == "eating")

                {

                    p5.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                }

                else if(fUser!.preferences[4] == "camping")

                {

                    p5.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                }

                else if(fUser!.preferences[4] == "sports")

                {

                    p5.image = UIImage(named: "3107821-200-1")

                }

                else if(fUser!.preferences[4] == "photography")

                {

                    p5.image = UIImage(named: "img_469468")

                }

                else if(fUser!.preferences[4] == "basketball")

                {

                    p5.image = UIImage(named: "81412-200")

                }

                else if(fUser!.preferences[4] == "reading")

                {

                    p5.image = UIImage(named: "130304")

                }

                else if(fUser!.preferences[4] == "running")

                {

                    p5.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                }

                if(fUser!.preferences[5] == "music")

                {

                    p6.image = UIImage(named: "music+note+sound+icon-1320183235697157602")

                }

                else if(fUser!.preferences[5] == "swimming")

                {

                    p6.image = UIImage(named: "11-512")

                }

                else if(fUser!.preferences[5] == "hiking")

                {

                    p6.image = UIImage(named: "45242-200")

                }

                else if(fUser!.preferences[5] == "gardening")

                {

                    p6.image = UIImage(named: "planting-1444113-1222073")

                }

                else if(fUser!.preferences[5] == "biking")

                {

                    p6.image = UIImage(named: "15900-200")

                }

                else if(fUser!.preferences[5] == "painting")

                {

                    p6.image = UIImage(named: "b3416cdaa1cf55b3c12d66498f5bc14d")

                }

                else if(fUser!.preferences[5] == "technology")

                {

                    p6.image = UIImage(named: "img_543487")

                }

                else if(fUser!.preferences[5] == "dancing")

                {

                    p6.image = UIImage(named: "3310358-200")

                }

                else if(fUser!.preferences[5] == "eating")

                {

                    p6.image = UIImage(named: "fd80ecec48eba2a9adb76e4133905879")

                }

                else if(fUser!.preferences[5] == "camping")

                {

                    p6.image = UIImage(named: "f0e202e0e83cccf938ba82d35c85ed33")

                }

                else if(fUser!.preferences[5] == "sports")

                {

                    p6.image = UIImage(named: "3107821-200-1")

                }

                else if(fUser!.preferences[5] == "photography")

                {

                    p6.image = UIImage(named: "img_469468")

                }

                else if(fUser!.preferences[5] == "basketball")

                {

                    p6.image = UIImage(named: "81412-200")

                }

                else if(fUser!.preferences[5] == "reading")

                {

                    p6.image = UIImage(named: "130304")

                }

                else if(fUser!.preferences[5] == "running")

                {

                    p6.image = UIImage(named: "1024px-Running_icon_-_Noun_Project_17825.svg")

                }

                // Do any additional setup after loading the view.



            }
        
 



        // Do any additional setup after loading the view.



    

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

