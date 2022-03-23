import UIKit

public extension UIView {
    
    func shadow () {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 10
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 20
    }
    
    func roundEdjes(radius: Int) {
        self.layer.cornerRadius = CGFloat(radius)
        self.layer.sublayers?.forEach {
            $0.cornerRadius = CGFloat(radius) / 2
        }
    }
    
    func roundObject () {
        let minSide = min(self.frame.height, self.frame.width)
        self.layer.cornerRadius = minSide / 2
        self.layer.sublayers?.forEach {
            $0.cornerRadius = minSide / 2
        }
    }
   
    func addGradientWithColor(withColors colors: [UIColor]) {
        
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = colors.map{$0.cgColor }
        gradient.startPoint = CGPoint(x: randomNumber(), y: randomNumber())
        gradient.endPoint = CGPoint(x: randomNumber(), y: randomNumber())
        self.layer.insertSublayer(gradient, at: 0)
        func randomNumber () -> Int {
            let randomNumber = Int.random(in: 0...1)
            return randomNumber
        }
    }
}
