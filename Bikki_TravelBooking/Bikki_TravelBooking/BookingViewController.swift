import UIKit

class BookingViewController: UIViewController {
    
    @IBOutlet weak var travellerNameOL: UITextField!
    @IBOutlet weak var noOfTravellersOL: UITextField!
    @IBOutlet weak var cabinTypeOL: UITextField!
    
    var travellerName = ""
    var noOfTravellers = 0
    var cabinType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func bookNowButton(_ sender: UIButton) {
        // Validate inputs
        guard let name = travellerNameOL.text, !name.isEmpty,
              let travellersText = noOfTravellersOL.text, let travellers = Int(travellersText),
              let cabin = cabinTypeOL.text, !cabin.isEmpty else {
            showAlert(title: "Missing Information", message: "Please fill in all fields correctly.")
            return
        }
        
        // Save valid data
        travellerName = name
        noOfTravellers = travellers
        cabinType = cabin
        
        // Perform segue
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "resultSegue" {
            if let destination = segue.destination as? BikkiResultViewController {
                destination.travellerName = travellerName
                destination.noOfTravellers = noOfTravellers
                destination.cabinType = cabinType
            }
        }
    }
    
    // Alert helper
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
