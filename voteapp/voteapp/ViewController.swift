//
//  ViewController.swift
//  voteapp
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
                let age:Double = Double(name)!        //check whwether it is cold or hot
                if age>18{
                    outputOL.text="u are not a kid decide u r leader🗳️"
                    imageviewOL.image=UIImage(named:"12.jpeg")
                }
                //temprature >60
                else{
                    imageviewOL.image=UIImage(named:"123.jpeg")
                    outputOL.text="still kid sleep in home🔞"
                }
            }
        }
