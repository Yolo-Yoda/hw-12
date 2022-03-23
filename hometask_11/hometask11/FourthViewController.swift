//
//  FourthViewController.swift
//  hometask.9
//
//  Created by Виктор Васильков on 3.03.22.
//

import UIKit

class FourthViewController: UIViewController {
    
    var endString: String? = nil
    
    let widthball: CGFloat = 50
    
    let heightball: CGFloat = 50
    
    var swipes: Int = 0
    
    var text = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        sequeString.text = endString
        callball()
        leftSwipe()
        rightSwipe()
        downSwipe()
        upSwipe()
    }
    
    func leftSwipe() {
        let leftswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(leftswipedByUser(_:)))
        leftswipeGesture.direction = .left
        self.view.addGestureRecognizer(leftswipeGesture)
    }
    
    func rightSwipe() {
        let rightswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(rightswipedByUser(_:)))
        rightswipeGesture.direction = .right
        self.view.addGestureRecognizer(rightswipeGesture)
    }
    
    func downSwipe() {
        let downswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(downswipedByUser(_:)))
        downswipeGesture.direction = .down
        self.view.addGestureRecognizer(downswipeGesture)
    }
    
    func upSwipe(){
        let upswipeGesture = UISwipeGestureRecognizer(target: self, action: #selector(upswipedByUser(_:)))
        upswipeGesture.direction = .up
        self.view.addGestureRecognizer(upswipeGesture)
    }
    
    func callball() {
        ball.frame = CGRect(x: view.frame.width / 2 - 25, y: view.frame.height / 2 - 25,
                            width: widthball, height: heightball)
        ball.backgroundColor = .lightGray
        ball.layer.cornerRadius = 25
    }
    
    func random() -> CGFloat {
            return CGFloat(arc4random()) / CGFloat(UInt32.max)
        }
    
    func random() -> UIColor {
            return UIColor(
               red:   random(),
               green: random(),
               blue:  random(),
               alpha: 1.0
            )
        }
    
    @IBOutlet weak var ball: UIView!
    
    @IBOutlet weak var sequeString: UILabel!

    
    @IBAction func close(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBSegueAction func sequefrom4to1(_ coder: NSCoder) -> ViewController? {
        let newViewController = ViewController(coder: coder)
        newViewController?.exittext = String(swipes)
        return newViewController
    }
    
    @objc private func leftswipedByUser (_ gesture:UISwipeGestureRecognizer) {
        if ball.frame.origin.x > 5 { ball.frame = CGRect(x: ball.frame.origin.x - 20,
                                                         y: ball.frame.origin.y,
                                                         width: widthball,
                                                         height: heightball)
            ball.backgroundColor = random()
        }
        swipes += 1
    }
    
    @objc private func rightswipedByUser (_ gesture:UISwipeGestureRecognizer) {
        if ball.frame.origin.x < view.frame.width - 55 { ball.frame = CGRect(x: ball.frame.origin.x + 20,
                                                                             y: ball.frame.origin.y,
                                                                             width: widthball,
                                                                             height: heightball)
            ball.backgroundColor = random()
        }
        swipes += 1
    }
    
    @objc private func downswipedByUser (_ gesture:UISwipeGestureRecognizer) {
        if ball.frame.origin.y < view.frame.height - 85 { ball.frame = CGRect(x: ball.frame.origin.x ,
                                                                              y: ball.frame.origin.y + 20,
                                                                              width: widthball,
                                                                              height: heightball)
            ball.backgroundColor = random()
        }
        swipes += 1
    }
    
    @objc private func upswipedByUser (_ gesture:UISwipeGestureRecognizer) {
        if ball.frame.origin.y > 70 { ball.frame = CGRect(x: ball.frame.origin.x ,
                                                          y: ball.frame.origin.y - 20,
                                                          width: widthball,
                                                          height: heightball)
            ball.backgroundColor = random()
        }
        swipes += 1
    }
    
}
