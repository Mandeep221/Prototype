//
//  ViewControllerAddition.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-06-26.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class AdditionViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    
    @IBOutlet weak var numOne: UILabel!
    @IBOutlet weak var numTwo: UILabel!
    
    @IBOutlet weak var numSum: ShakingTextField!
    
    
    @IBOutlet weak var nextButton: UIButton!
    
    var randomNum1 = Int(arc4random_uniform(6) + 1)
    var randomNum2 = Int(arc4random_uniform(6) + 1)
    
    @IBOutlet weak var collectionViewNumberOne: UICollectionView!
    
    @IBOutlet weak var collectionViewNumberTwo: UICollectionView!
    
    
    @IBOutlet weak var collectionViewSum: UICollectionView!
    
    @IBOutlet weak var answerReactionImageView: UIImageView!
    
    
    @IBOutlet weak var answerFeedback: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        numOne.text = String(randomNum1)
        numTwo.text = String(randomNum2)
        
        collectionViewNumberOne.delegate = self
        collectionViewNumberOne.dataSource = self
        
        collectionViewNumberTwo.delegate = self
        collectionViewNumberTwo.dataSource = self
        
        collectionViewSum.delegate = self
        collectionViewSum.dataSource = self
        
        
        // Do any additional setup after loading the view.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if collectionView == self.collectionViewNumberOne
        {
            return randomNum1
        }else if collectionView == self.collectionViewNumberTwo{
            return randomNum2
        }else{
           return randomNum1 + randomNum2
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCellUnitIndicator
        
        return cell
    }
    
    @IBAction func answerTextChanged(_ sender: Any) {
       nextButton.setTitle("GO!", for: .normal)
    }
    
    @IBAction func nextTapped(_ sender: Any) {
        
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
            
            // assign those random numbers to the labels
            numOne.text = String(randomNum1)
            numTwo.text = String(randomNum2)
            
            // update the dots
            collectionViewNumberOne.reloadData()
            collectionViewNumberTwo.reloadData()
            
            collectionViewSum.reloadData()
            
        }
        
    }
}
