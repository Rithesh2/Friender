//
//  ViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 7/26/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import AVKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class ViewController: UIViewControllerX {

    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
   /* override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    } */
    func setUpElements()
    {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
    }
    
    @IBAction func resetButton(_ sender: Any) {
        
        let db = Firestore.firestore()
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            }
            
            var copyDocuments = querySnapshot!.documents
            print(copyDocuments)
 
            for (index, element) in copyDocuments.enumerated() {
                if(copyDocuments[index].data()["preferences"] == nil)
                {
                    querySnapshot!.documents[index].reference.delete()
                    
                }
            }
                // print(users)
                
                //print(document.data())
                //print(document.get("preferences")!)
            }
        
        
        /*
        var count = 0
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
                return
            }
            
 
            for document in querySnapshot!.documents {
                if (count > 9)
                {
                    document.reference.delete()
                }
                count = count + 1
            }
                // print(users)
                
                //print(document.data())
                //print(document.get("preferences")!)
            }
 */
    }
    func setUpVideo()
    {
        let bundlePath = Bundle.main.path(forResource: "loginbg", ofType: "mp4")
        guard bundlePath != nil else{
            return
        }
        let url = URL(fileURLWithPath: bundlePath!)
        //Create the video player item
        let item = AVPlayerItem(url: url)
        //Create the player
        videoPlayer = AVPlayer(playerItem: item)
        //Create the layer
        videoPlayerLayer = AVPlayerLayer(player: videoPlayer!)
        videoPlayerLayer?.frame = CGRect(x: 0, y: 0, width:
            self.view.frame.size.width, height:
            self.view.frame.size.height
        )
        view.layer.insertSublayer(videoPlayerLayer!, at: 0)
        //Adjust the size and frame
        //Display it and play it
        videoPlayer?.playImmediately(atRate: 1)
    }


}


extension UIImageView {
    func setImage(from url: String) {
        guard let imageURL = URL(string: url) else { return }

            // just not to cause a deadlock in UI!
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: imageURL) else { return }

            let image = UIImage(data: imageData)
            DispatchQueue.main.async {
                self.image = image
            }
        }
    }
}


