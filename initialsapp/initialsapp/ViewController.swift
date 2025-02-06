//
//  ViewController.swift
//  initialsapp
//
//  Created by sai vinay kumar bikki on 1/30/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var inputOL2: UITextField!
    
    
    @IBOutlet weak var outputOL: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func submitBtnClicked(_ sender: Any) {
        // need to create an intials app
        let firstName = inputOL.text!//declaring variable to read first name
        let lastName = inputOL2.text!//declaring variable to read last name
        //need to get first letters of both
        let initials = "\(firstName.first!) \(lastName.first!)"
        outputOL.text = "Your initials are: " + initials.uppercased()
    }
    
}

