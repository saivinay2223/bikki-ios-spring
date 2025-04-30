//
//  ResultViewController.swift
//  table view demo
//
//  Created by sai vinay kumar bikki on 4/8/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var DisplayLabel: UILabel!
    var product : Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        DisplayLabel.text = "The product name is \(product!.productName) and its description \(product!.productDescription)"
        

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
