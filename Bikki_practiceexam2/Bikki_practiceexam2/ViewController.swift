//
//  ViewController.swift
//  Bikki_practiceexam2
//
//  Created by sai vinay kumar bikki on 4/1/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var activityTextField: UITextField!
    
    @IBOutlet weak var durationTextField: UITextField!
    
    @IBOutlet weak var caloriesTextField: UITextField!
    
    @IBOutlet weak var calculateButton: UIButton!
    var totalCaloriesBurned: Double = 0.0
        var activityType: String = ""
        var duration: Double = 0.0
        var caloriesPerMinute: Double = 0.0
        
        // MARK: - Lifecycle
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
        
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            resetFields()
        }
        
    @IBAction func calculateButtonTapped(_ sender: Any) {
        guard validateInputs() else {
            showAlert(message: "Please fill all fields with valid values.")
            return
        }
        calculateCalories()
    }


    
    @IBAction func resetButtonTapped(_ sender: Any) {
        resetFields()
            }
            
            // MARK: - Helper Methods
            private func setupUI() {
                calculateButton.isEnabled = false
                [activityTextField, durationTextField, caloriesTextField].forEach { textField in
                    textField?.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
                }
            }
            
            @objc func textFieldsChanged() {
                calculateButton.isEnabled = validateInputs()
            }
            
            private func validateInputs() -> Bool {
                guard let activity = activityTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !activity.isEmpty,
                      let durationText = durationTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !durationText.isEmpty,
                      let caloriesText = caloriesTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !caloriesText.isEmpty,
                      let _ = Double(durationText),
                      let _ = Double(caloriesText) else {
                    return false
                }
                return true
            }
            
            private func calculateCalories() {
                guard let activity = activityTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                      let durationText = durationTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                      let caloriesText = caloriesTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines),
                      let duration = Double(durationText),
                      let caloriesPerMinute = Double(caloriesText) else { return }
                
                self.activityType = activity
                self.duration = duration
                self.caloriesPerMinute = caloriesPerMinute
                self.totalCaloriesBurned = duration * caloriesPerMinute
            }
            
            private func resetFields() {
                activityTextField.text = ""
                durationTextField.text = ""
                caloriesTextField.text = ""
                calculateButton.isEnabled = false
            }
            
            private func showAlert(message: String) {
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
            
            // MARK: - Navigation
            override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                if segue.identifier == "resultsegue",
                   let destinationVC = segue.destination as? ResultViewController {
                    destinationVC.activityType = activityType
                    destinationVC.duration = duration
                    destinationVC.caloriesPerMinute = caloriesPerMinute
                    destinationVC.totalCaloriesBurned = totalCaloriesBurned
                }
            }
        }
