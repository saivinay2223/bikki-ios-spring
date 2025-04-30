//
//  ResultViewController.swift
//  Bikki_practiceexam2
//
//  Created by sai vinay kumar bikki on 4/1/25.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var activityLabel: UILabel!
    
    @IBOutlet weak var durationLabel: UILabel!
    
    @IBOutlet weak var caloriesLabel: UILabel!
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var activityImageView: UIImageView!
    
    var activityType: String = ""
        var duration: Double = 0.0      // Changed to Double
        var caloriesPerMinute: Double = 0.0
        var totalCaloriesBurned: Double = 0.0
        
        // MARK: - Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            updateUI()
            animateImageView()
        }
        
        // MARK: - Helper Methods
        private func updateUI() {
            // Update labels
            activityLabel.text = "Activity Type: \(activityType)"
            durationLabel.text = String(format: "Duration: %.0f min", duration)
            caloriesLabel.text = String(format: "Calories per Minute: %0.0f", caloriesPerMinute)
            totalLabel.text = String(format: "Total Calories Burned: %0.0f", totalCaloriesBurned)
            
            // Set image based on activity type (ensure lowercase naming)
            let imageName = activityType.lowercased()
            activityImageView.image = UIImage(named: imageName) ?? UIImage(named: "default")
        }
        
        private func animateImageView() {
            activityImageView.alpha = 0.0
            UIView.animate(withDuration: 1.5) {
                self.activityImageView.alpha = 1.0
            }
        }
    }
