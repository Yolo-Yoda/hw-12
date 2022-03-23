import UIKit

class ViewController: UIViewController {
    
   
    let getBio = Bio(name: "Viktor", country: "Belarus", yearOfFoundation: 2022)
    let endedString = "The end"
    var exittext: String? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        if exittext == nil {
            swipeLabel.text = "Сыграй в последнюю игру чтобы увидеть количество свайпов"
        } else {
            swipeLabel.text = "Количество свайпов в 3 игре: \(exittext ?? "")"
        }
    }
    
    @IBOutlet weak var swipeLabel: UILabel!
    
    @IBSegueAction func contactSeque(_ coder: NSCoder) -> ContactViewController? {
        let newContactViewController = ContactViewController(coder: coder)
        newContactViewController?.gettedBio = getBio
        return newContactViewController
    }
    
    @IBSegueAction func stringFrom1to2(_ coder: NSCoder) -> SecondViewController? {
        let newContactViewController = SecondViewController(coder: coder)
        newContactViewController?.sequeendedString = endedString
        return newContactViewController
    }
    
}

