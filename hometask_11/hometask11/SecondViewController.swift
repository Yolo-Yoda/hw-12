import UIKit

class SecondViewController: UIViewController {
    
    var stackofCircles: [UIView] = []
    let widthOfBall = 80
    let heightOfBall = 80
    var sequeendedString : String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    func random() -> CGFloat {
            return CGFloat(arc4random()) / CGFloat(UInt32.max)
        }
    
    func randomcolor() -> UIColor {
            return UIColor(
               red:   random(),
               green: random(),
               blue:  random(),
               alpha: 1.0
            )
        }
    
    @IBAction func close(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func tap(_ sender: UITapGestureRecognizer) {
        let locationcircle = sender.location(in: view)
        let maxX = view.frame.width - 80
        let maxY = view.frame.height - 40
        let halfOfBall = CGFloat(widthOfBall / 2)
        
        for i in 0..<stackofCircles.count {
            if stackofCircles[i].frame.contains(locationcircle) {
                stackofCircles[i].removeFromSuperview()
                stackofCircles.remove(at: i)
                return
            }
        }

        if locationcircle.x - halfOfBall > 0 &&
            locationcircle.x < maxX + halfOfBall &&
            locationcircle.y < maxY &&
            locationcircle.y > halfOfBall {
            
            let circle = UIView()
            circle.frame = CGRect(x: locationcircle.x - halfOfBall,
                                  y: locationcircle.y - halfOfBall,
                                  width: CGFloat(widthOfBall),
                                  height: CGFloat(heightOfBall))
            //circle.roundObject()
            circle.addGradientWithColor(withColors: [randomcolor(), randomcolor()])
            circle.roundObject()
            circle.shadow()
            stackofCircles.append(circle)
            view.addSubview(circle)
                }
    }
    func animationBalls () {
        
        let myFrameHeight = CGFloat(view.frame.height) - CGFloat(heightOfBall)

        UIView.animate(withDuration: 1,
                       delay: 0,
                       animations: {
            for i in self.stackofCircles {
                i.frame = CGRect(x: i.frame.minX, y: myFrameHeight, width: CGFloat(self.widthOfBall) , height: CGFloat(self.heightOfBall))
            }

        }, completion: {_ in

        })
    }
    @IBAction func pushAnmate(_ sender: UIButton) {
        animationBalls()
    }
    @IBOutlet weak var animateButton: UIButton!
    
    
}


