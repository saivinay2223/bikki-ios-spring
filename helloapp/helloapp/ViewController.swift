//
//  ViewController.swift
//  helloapp
//
//  Created by Bikki,Sai Vinay Kumar on 1/21/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var outputOL: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func submitBtnClick(_ sender: UIButton) {
    
    // read the text field data or user input and assign it to a variable
        var name = inputOL.text!
        //display  the output in("hello,\(name)!")
        outputOL.text="Hello,\(name)!"
    }
}

