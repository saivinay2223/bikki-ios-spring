//
//  ViewController.swift
//  wordguessapp
//
//  Created by sai vinay kumar bikki on 2/13/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var displayOL: UILabel!
    
    @IBOutlet weak var hintOL: UILabel!
    
    @IBOutlet weak var inputOL: UITextField!
    
    @IBOutlet weak var checkOL: UIButton!
    
    
    @IBOutlet weak var messageOL: UILabel!
    
    @IBOutlet weak var playagainOL: UIButton!
    //creating an array with the letter and hint in the format [[swift,programming],[],[]]
    var words = [["JAVA", "Programming Language"],["DOG", "Animal"],["COLD", "Weather Condition"],["APPLE", "Fruit"]]
        
        var count = 0;
        var word = ""
        var lettersGuessed = ""

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //disabling check button
        checkOL.isEnabled=false
        //first letter from the word arrary
        word=words[count][0]
        //intialize the displY LABEL with underscores
        displayOL.text = ""
                for letter in word {
                    displayOL.text!.append(" _")
                }
                hintOL.text = "Hint: " + words[count][1]
                messageOL.text = ""
            }

    @IBAction func checkBtnClick(_ sender: UIButton) {
        // need to get the text
        var letters = inputOL.text!
                lettersGuessed += letters
        //check if word correctly guessed or not 
                var newDisplay = ""
                for letter in word {
                    if lettersGuessed.contains(String(letter)) {
                        newDisplay += "\(letter)"
                    } else {
                        newDisplay += "_ "
                    }
                }
                displayOL.text = newDisplay
                inputOL.text = ""
                
                if displayOL.text?.contains("_") == false {
                    playagainOL.isHidden = false
                    checkOL.isEnabled = false
                }
            }

    
    @IBAction func playagainBtnClick(_ sender: UIButton) {
        //enabld playagain and reset and have to move to the next word
        playagainOL.isHidden = true
                displayOL.text = ""
                count += 1
                lettersGuessed = ""
        // if all words guessed print congratulations
                if count == words.count {
                    messageOL.text = "Congratulations! You Win!"
                    hintOL.text = ""
                }
                else{
                    word = words[count][0]
                    hintOL.text = "Hint: " + words[count][1]
                    checkOL.isEnabled = true
                    
                    displayOL.text = ""
                    updateUnderscores()
                }
            }
            
    @IBAction func letterEntered(_ sender: UITextField) {
        var letters = inputOL.text!
                //letters = String(letters.last ?? " ")
                inputOL.text = letters
                
                if letters.isEmpty{
                    checkOL.isEnabled = false
                } else {
                    checkOL.isEnabled = true
                }
            }
            
            //To update the underscores in displayLabel based on the number of letters
            func updateUnderscores(){
                    for letter in word{
                        displayOL.text! += "_ "
                    }
                }
            
        }
