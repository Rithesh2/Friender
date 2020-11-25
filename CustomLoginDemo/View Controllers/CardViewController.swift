//
//  CardViewController.swift
//  CustomLoginDemo
//
//  Created by Rohit Ravi on 11/24/20.
//  Copyright © 2020 Rohit Ravi. All rights reserved.
//

import UIKit

class CardViewController: UIViewController {

    @IBOutlet weak var card: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    var divisor: CGFloat!
    var index = 1
    var names: Array<String> = ["rohit", "divya", "rithesh"]
    override func viewDidLoad() {
        super.viewDidLoad()
        card.layer.borderWidth = 10
        card.layer.borderColor = UIColor.red.cgColor
        divisor = (view.frame.width / 2) / 0.61//0.61 is the radians for 35 degrees
        nameLabel.text = names[0]
        // Do any additional setup after loading the view.
    }
    
    @IBAction func panCard(_ sender: UIPanGestureRecognizer) {
        let card = sender.view!
        let point = sender.translation(in: view)
        let xFromCenter = card.center.x - view.center.x
        let delay = 0.6
        card.center = CGPoint(x: view.center.x + point.x, y: view.center.y + point.y)
        
        let scale = min(100/abs(xFromCenter), 1)
        card.transform = CGAffineTransform(rotationAngle: xFromCenter/divisor).scaledBy(x: scale, y: scale)
        
        
        if sender.state == UIGestureRecognizer.State.ended{
            if card.center.x < 75 {
                UIView.animate(withDuration: 0.5, animations: { card.center = CGPoint(x: card.center.x - 200, y: card.center.y + 75)
                    card.alpha = 0
                })
                card.alpha = 0
                card.center = CGPoint(x: view.center.x + 300, y: card.center.y + 75)
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.getNewCard()
                }
                return
            }
            else if card.center.x > (view.frame.width-75){
                UIView.animate(withDuration: 0.3, animations: { card.center = CGPoint(x: card.center.x + 200, y: card.center.y + 75)
                    card.alpha = 0 
                })
    
                DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
                    self.getNewCard()
                }
                return
            }
            UIView.animate(withDuration: 0.5, animations: {
                self.card.center = self.view.center
                self.card.transform = .identity
            })
        }
    }
    
    func getNewCard(){

        UIView.animate(withDuration: 1, animations: {
            self.nameLabel.text = self.names[self.index]
            if(self.index == self.names.count-1)
            {
                self.index = 0
            }
            else{
                self.index = self.index + 1
            }
            self.card.center = self.view.center
            self.card.alpha = 1
            self.card.transform = .identity
        })}
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation  before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
