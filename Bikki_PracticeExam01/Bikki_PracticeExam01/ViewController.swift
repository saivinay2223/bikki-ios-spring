//
//  ViewController.swift
//  Bikki_PracticeExam01
//
//  Created by sai vinay kumar bikki on 2/20/25.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var heightFeetTextField: UITextField!
    
    @IBOutlet weak var heightInchesTextField: UITextField!
    
    @IBOutlet weak var weightTextField: UITextField!
    
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBOutlet weak var categoryImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func calculateBMI(_ sender: Any) {
        //get the input values
        guard let feetText = heightFeetTextField.text, let inchesText = heightInchesTextField.text, let weightText = weightTextField.text,
              let feet = Double(feetText), let inches = Double(inchesText), let weight = Double(weightText) else {
            resultLabel.text = "Please enter valid numbers."
            return
        }
        
        // Convert height to inches
        let heightInInches = (feet * 12) + inches
        
        // Calculate BMI
        let bmi = (703 * weight) / (heightInInches * heightInInches)
        let roundedBMI = round(bmi * 10) / 10
        
        // Determine category and health tip using if-else statements
        var category: String
        var healthTip: String
        var imageName: String
        
        if roundedBMI <= 18.5 {
            category = "Underweight🪫"
            healthTip = "Eat more protein and healthy fats."
            imageName = "underWeight"
        } else if roundedBMI >= 18.6 && roundedBMI <= 24.9 {
            category = "Normal👌"
            healthTip = "Excellent! Maintain a balanced lifestyle."
            imageName = "normal"
        } else if roundedBMI >= 25 && roundedBMI <= 29.9 {
            category = "Overweight😵"
            healthTip = "Lose weight by maintaining a balanced diet and increasing physical activity."
            imageName = "overWeight"
        } else {
            category = "Obesity/Obese"
            healthTip = "Consult a doctor for personalized advice."
            imageName = "obese"
        }
        
        // Update the result label and image
        resultLabel.text = """
           Your Body Mass Index is \(roundedBMI).
           This is considered \(category).
           Health tip: \(healthTip)
           """
        categoryImageView.image = UIImage(named: imageName)
    }
}
