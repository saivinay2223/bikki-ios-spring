//
//  ViewController.swift
//  Bikki_exam2
//
//  Created by sai vinay kumar bikki on 4/3/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var goalTypeTextField: UITextField!
    
    @IBOutlet weak var targetAmountTextField: UITextField!
    
    @IBOutlet weak var interestRateTextField: UITextField!
    
    @IBOutlet weak var timePeriodTextField: UITextField!
    @IBOutlet weak var calculateBtnOL: UIButton!
    
    @IBOutlet weak var resetBtnOL: UIButton!
    var totalMonths: Double = 0.0
        var monthlyInterestRate: Double = 0.0
        var monthlySavingsPayment: Double = 0.0
        
        override func viewDidLoad() {
            super.viewDidLoad()
            calculateBtnOL.isEnabled = false
            resetBtnOL.isEnabled = false
            
            [goalTypeTextField, targetAmountTextField, interestRateTextField, timePeriodTextField].forEach {
                $0?.addTarget(self, action: #selector(textFieldsChanged), for: .editingChanged)
            }
        }
    @objc func textFieldsChanged() {
            if let goalType = goalTypeTextField.text, !goalType.isEmpty,
               let targetAmount = targetAmountTextField.text, !targetAmount.isEmpty,
               let interestRate = interestRateTextField.text, !interestRate.isEmpty,
               let timePeriod = timePeriodTextField.text, !timePeriod.isEmpty {
                calculateBtnOL.isEnabled = true
                resetBtnOL.isEnabled = true
            } else {
                calculateBtnOL.isEnabled = false
                resetBtnOL.isEnabled = false
            }
        }
        

    @IBAction func calculateSavingsPressed(_ sender: Any) {
        guard let goalType = goalTypeTextField.text, !goalType.isEmpty,
                     let targetAmount = Double(targetAmountTextField.text ?? ""),
                     let interestRate = Double(interestRateTextField.text ?? ""),
                     let timePeriod = Double(timePeriodTextField.text ?? "") else {
                   showAlert(message: "Please enter valid values for all fields")
                   return
               }
               
               totalMonths = timePeriod * 12
               monthlyInterestRate = (interestRate / 100) / 12
               
               if monthlyInterestRate == 0 {
                   monthlySavingsPayment = targetAmount / totalMonths  // Handle zero-interest case
               } else {
                   monthlySavingsPayment = targetAmount / ((pow(1 + monthlyInterestRate, totalMonths) - 1) / monthlyInterestRate)
               }
               
              
           }
           
           override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
               if segue.identifier == "resultsegue",
                  let destinationVC = segue.destination as? ResultViewController {
                   destinationVC.goalType = goalTypeTextField.text
                   destinationVC.targetAmount = targetAmountTextField.text
                   destinationVC.interestRate = interestRateTextField.text
                   destinationVC.monthlySavings = String(format: "%.2f", monthlySavingsPayment)
               }
           }
           
    @IBAction func resetPressed(_ sender: Any) {
        goalTypeTextField.text = ""
                targetAmountTextField.text = ""
                interestRateTextField.text = ""
                timePeriodTextField.text = ""
                calculateBtnOL.isEnabled = false
                resetBtnOL.isEnabled = false
            }
            
            func showAlert(message: String) {
                let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default))
                present(alert, animated: true)
            }
        }
