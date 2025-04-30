import UIKit

class BikkiResultViewController: UIViewController {
    
    @IBOutlet weak var imageOL: UIImageView!
    @IBOutlet weak var travellerNameOL: UILabel!
    @IBOutlet weak var noOfTravellersOL: UILabel!
    @IBOutlet weak var cabinTypeOL: UILabel!
    @IBOutlet weak var totalCostOL: UILabel!
    @IBOutlet weak var resultOL: UILabel!
    
    var travellerName: String = ""
    var noOfTravellers: Int = 0
    var cabinType: String = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    private func updateUI() {
        travellerNameOL.text = "Traveller Name: \(travellerName)"
        noOfTravellersOL.text = "No. of Guests: \(noOfTravellers)"
        cabinTypeOL.text = "Class Type: \(cabinType.lowercased().capitalized)"
        
        let cabin = cabinType.lowercased()
        var totalCost = 0
        
        switch cabin {
        case "economy":
            totalCost = noOfTravellers * 150
            totalCostOL.text = "Total Cost: $\(totalCost)"
            resultOL.text = "Enjoy your Economy Trip!"
            imageOL.image = UIImage(named: "economy")
            
        case "luxury":
            totalCost = noOfTravellers * 250
            totalCostOL.text = "Total Cost: $\(totalCost)"
            resultOL.text = "Enjoy your Luxury Trip!"
            imageOL.image = UIImage(named: "luxury")
            
        default:
            totalCostOL.text = "Total Cost:"
            resultOL.text = "Please select a valid class"
            cabinTypeOL.text = "Class Type:"
            imageOL.image = UIImage(named: "error")
        }
    }
}
