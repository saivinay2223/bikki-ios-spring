//
//  ViewController.swift
//  Bikki_CalculatorApp
//
//  Created by sai vinay kumar bikki on 2/19/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var resultOutlet: UILabel!
    // Variables to store values and operator
        var firstNumber: Double = 0
        var secondNumber: Double = 0
        var currentOperator: String = ""
        var isTypingNumber = false
        
        override func viewDidLoad() {
            super.viewDidLoad()
            resultOutlet.text = "0"
        }
    @IBAction func number0Pressed(_ sender: Any) {
        appendNumber("0")
    }
    @IBAction func number1Pressed(_ sender: Any) {
        appendNumber("1")
    }
    @IBAction func number2Pressed(_ sender: Any) {
        appendNumber("2")
    }
    @IBAction func number3Pressed(_ sender: Any) {
        appendNumber("3")
    }
    @IBAction func number4Pressed(_ sender: Any) {
        appendNumber("4")
    }
    @IBAction func number5Pressed(_ sender: Any) {
        appendNumber("5")
    }
    @IBAction func number6Pressed(_ sender: Any) {
        appendNumber("6")
    }
    @IBAction func number7Pressed(_ sender: Any) {
        appendNumber("7")
    }
    @IBAction func number8Pressed(_ sender: Any) {
        appendNumber("8")
    }
    @IBAction func number9Pressed(_ sender: Any) {
        appendNumber("9")
    }
    @IBAction func decimalPressed(_ sender: Any) {
        appendNumber(".")
    }
    // Helper function to append numbers
        func appendNumber(_ number: String) {
            if isTypingNumber {
                resultOutlet.text = resultOutlet.text! + number
            } else {
                resultOutlet.text = number
                isTypingNumber = true
            }
        }
    
    @IBAction func addPressed(_ sender: Any) {
        setOperator("+")
    }
    @IBAction func subtractPressed(_ sender: Any) { 
        setOperator("-")
    }
    @IBAction func multiplyPressed(_ sender: Any) {
        setOperator("*")
    }
    @IBAction func dividePressed(_ sender: Any) {
        setOperator("/")
    }
    @IBAction func moduloPressed(_ sender: Any) {
        setOperator("%")
    }
    // Function to set operator
        func setOperator(_ op: String) {
            firstNumber = Double(resultOutlet.text!)!
            currentOperator = op
            isTypingNumber = false
        }
    @IBAction func equalsPressed(_ sender: Any) {
        secondNumber = Double(resultOutlet.text!)!
                var result: Double = 0
                
                switch currentOperator {
                case "+": result = firstNumber + secondNumber
                case "-": result = firstNumber - secondNumber
                case "*": result = firstNumber * secondNumber
                case "/": result = secondNumber == 0 ? Double.nan : firstNumber / secondNumber
                case "%": result = firstNumber.truncatingRemainder(dividingBy: secondNumber)
                default: break
                }
                
                resultOutlet.text = formatResult(result)
                isTypingNumber = false
    }
    @IBAction func clearAllPressed(_ sender: Any) {
        firstNumber = 0
                secondNumber = 0
                currentOperator = ""
                resultOutlet.text = "0"
                isTypingNumber = false
    }
    @IBAction func clearEntryPressed(_ sender: Any) {
        resultOutlet.text = "0"
                isTypingNumber = false
            }
    
@IBAction func signChangePressed(_ sender: Any) {
    if let value = Double(resultOutlet.text!) {
        resultOutlet.text = String(value * -1)
    }
}
            // Format result to remove .0 if whole number
            func formatResult(_ result: Double) -> String {
                return result.truncatingRemainder(dividingBy: 1) == 0 ? String(Int(result)) : String(format: "%.2f", result)
            }
        }

