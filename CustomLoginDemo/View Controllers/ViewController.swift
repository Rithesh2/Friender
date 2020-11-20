//
//  ViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 7/26/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit
import AVKit
class ViewController: UIViewController {

    var videoPlayer:AVPlayer?
    var videoPlayerLayer:AVPlayerLayer?
    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUpElements()
    }
    override func viewWillAppear(_ animated: Bool) {
        setUpVideo()
    }
    func setUpElements()
    {
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
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


