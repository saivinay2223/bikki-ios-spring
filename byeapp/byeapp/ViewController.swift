//
//  ViewController.swift
//  byeapp
//
//  Created by Bikki,Sai Vinay Kumar on 1/21/25.
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


    @IBAction func submitBtnClick(_ sender: UIButton) {
        // read the text field data or user input and assign it to a variable
            var name = inputOL.text!
        var name2 = inputOL2.text!
        //display  the output in("goodbye,\(name)!")
        outputOL.text="GoodBye, \(name)\(name2)!"
    }
}

