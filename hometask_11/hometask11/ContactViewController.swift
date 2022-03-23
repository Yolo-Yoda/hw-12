import UIKit

class ContactViewController: UIViewController {
    
    var gettedBio : Bio? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = "Name: \(gettedBio?.name ?? "Don't have information")"
        countryLabel.text = "Our country: \(gettedBio?.country ?? "Don't have information")"
        yearLabel.text = "Year of foundation:\(gettedBio?.yearOfFoundation ?? 2022)"
    }
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var countryLabel: UILabel!
    
    @IBOutlet weak var yearLabel: UILabel!
    
    @IBOutlet weak var contactViewStack: UILabel!
    
}
