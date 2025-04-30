//
//  ViewController.swift
//  coursedisplayapp
//
//  Created by sai vinay kumar bikki on 2/11/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageviewOL: UIImageView!
    

    @IBOutlet weak var crsNumOL: UILabel!
    
    @IBOutlet weak var crsTitleOL: UILabel!
    
    @IBOutlet weak var semOfferedOL: UILabel!
    
    @IBOutlet weak var prevBtnClickedOL: UIButton!
    
    @IBOutlet weak var nextBtnOL: UIButton!
    let courses = [["i1","44555","Introduction to Computer Science","Semester 1"],[ "i2","66777","Data Structures","Semester 2"],["i4","88999","Operating Systems","Semester 3"]]
    
    var imageIndex = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //image with name i1
        //update the course details with the first element in the array
       //prev btn is disabled and next btn is enabled
        let courseDetails = courses[0]
        crsNumOL.text = courseDetails[1]
        crsTitleOL.text = courseDetails[2]
        semOfferedOL.text = courseDetails[3]
        imageviewOL.image = UIImage(named: "i1")
        //prev btn is disabled
        prevBtnClickedOL.isEnabled = false
        //next btn is is enabled
        nextBtnOL.isEnabled = true
       
    }

    @IBAction func prevBtnClicked(_ sender: Any) {
        imageIndex -= 1
        
        crsNumOL.text = courses[imageIndex][1]
        crsTitleOL.text = courses[imageIndex][2]
        semOfferedOL.text = courses[imageIndex][3]
        imageviewOL.image = UIImage(named: courses[imageIndex][0])
        prevBtnClickedOL.isEnabled = true
       
        if(imageIndex == 0){
            prevBtnClickedOL.isEnabled = true
        }
    }
    @IBAction func nextBtnClicked(_ sender: Any) {
        //update the details of the next   course
        imageIndex += 1
        
        crsNumOL.text = courses[imageIndex][1]
        crsTitleOL.text = courses[imageIndex][2]
        semOfferedOL.text = courses[imageIndex][3]
        imageviewOL.image = UIImage(named: courses[imageIndex][0])
        prevBtnClickedOL.isEnabled = true
       
        if(imageIndex == courses.count - 1){
            nextBtnOL.isEnabled = true
        }
    }
}

