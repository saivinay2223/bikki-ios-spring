//
//  ViewController.swift
//  climateapp
//
//  Created by sai vinay kumar bikki on 1/23/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputOL: UITextField!
    
    
    @IBOutlet weak var outputOL: UILabel!
    
    
    @IBOutlet weak var imageviewOL: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func submitBtnClicked(_ sender: UIButton) {
        //read the tempurature
        //convert string to double
        let name = inputOL.text!
        let temp:Double = Double(name)!        //check whwether it is cold or hot
        if temp>60{
            outputOL.text="it is hot 🥵"
            imageviewOL.image=UIImage(named:"image1.jpeg")
        }
        //temprature >60
        else{
            imageviewOL.image=UIImage(named:"image2.jpeg")
            outputOL.text="it is cold 🥶"
        }
    }
}
    


