//
//  ResultViewController.swift
//  Bikki_exam2
//
//  Created by sai vinay kumar bikki on 4/3/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var goalTypeLabel: UILabel!
    
    @IBOutlet weak var targetAmountLabel: UILabel!
    
    @IBOutlet weak var interestRateLabel: UILabel!
    
    @IBOutlet weak var monthlySavingsLabel: UILabel!
    
    @IBOutlet weak var goalImageView: UIImageView!
    var goalType: String?
        var targetAmount: String?
        var interestRate: String?
        var monthlySavings: String?

        override func viewDidLoad() {
            super.viewDidLoad()
            
            goalTypeLabel.text = "Goal Type: \(goalType ?? "")"
            targetAmountLabel.text = "Target Amount: \(targetAmount ?? "")"
            interestRateLabel.text = "Interest Rate: \(interestRate ?? "%")"
            monthlySavingsLabel.text = "Monthly Savings: \(monthlySavings ?? "")"
            
            setGoalImage()
            animateImage()
        }
        
        func setGoalImage() {
            switch goalType?.lowercased() {
            case "car":
                goalImageView.image = UIImage(named: "car")
            case "vacation":
                goalImageView.image = UIImage(named: "vacation")
            case "home":
                goalImageView.image = UIImage(named: "home")
            default:
                goalImageView.image = UIImage(named: "default_image")
            }
        }
        
        func animateImage() {
            goalImageView.alpha = 0.0
            UIView.animate(withDuration: 1.5) {
                self.goalImageView.alpha = 1.0
            }
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            goalType = ""
            targetAmount = ""
            interestRate = ""
            monthlySavings = ""
        }
    }
