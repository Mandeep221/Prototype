//
//  SubtractionViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-06-27.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class SubtractionViewController: UIViewController {

    var randomNum1 = Int(arc4random_uniform(6) + 1)
    var randomNum2 = Int(arc4random_uniform(6) + 1)
    
    @IBOutlet weak var diceNumOneImage: UIImageView!
    
    @IBOutlet weak var diceNumTwoImage: UIImageView!
    
    @IBOutlet weak var numSum: DesignableTextField!
    
   
    @IBOutlet weak var nextButton: UIButton!
    
    @IBOutlet weak var answerReactionImageView: UIImageView!
    
    @IBOutlet weak var answerFeedback: UILabel!
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.numSum.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("Difficulty level: \(UserDefaults.standard.integer(forKey: "addsub"))")
        
        diceNumOneImage.image = UIImage(named: "dice_\(randomNum1).png")
        
         diceNumTwoImage.image = UIImage(named: "dice_\(randomNum2).png")
    
        // numbers only
        self.numSum.keyboardType = UIKeyboardType.decimalPad
        
        // fix max length
            
        
    }

    @IBAction func sumTextChanged(_ sender: Any) {
        nextButton.setTitle("GO!", for: .normal)
    }
    
    
    @IBAction func nextClicked(_ sender: Any) {
        
        // close keypad
         self.numSum.endEditing(true)
        
        if nextButton.titleLabel?.text == "GO!"{
            
            // check if the given answer was empty
            if numSum.text == ""{
                numSum.shake()
                answerFeedback.text = "Answer can not be empty!"
                let image = UIImage(named: "thinking.png");
                answerReactionImageView.image = image
            }else{
                // Check if the answer is correct or incorrect
                
                let answer = Int(numSum!.text!);
                
                if(answer == randomNum1 + randomNum2){
                    // Correct
                    answerFeedback.text = "Correct!"
                    let image = UIImage(named: "happy.png");
                    answerReactionImageView.image = image
                    
                    // change the button label
                    nextButton.setTitle("NEXT", for: .normal)
                }else{
                    // Incorrect
                    numSum.shake()
                    answerFeedback.text = "Try Again!"
                    let image = UIImage(named: "thinking.png");
                    answerReactionImageView.image = image
                }
            }
        }else{
            
            // delete the previous answer
            numSum.text = ""
            answerFeedback.text = "All the best!"
            let image = UIImage(named: "smile.png");
            answerReactionImageView.image = image
            
            // generate random number between 1 to 6
            randomNum1 = Int(arc4random_uniform(6) + 1)
            randomNum2 = Int(arc4random_uniform(6) + 1)
            
            // update the dice images
            diceNumOneImage.image = UIImage(named: "dice_\(randomNum1).png")
            
            diceNumTwoImage.image = UIImage(named: "dice_\(randomNum2).png")
            
            
        }
    }
}
