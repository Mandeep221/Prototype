//
//  AddSubViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-05-16.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class AddSubViewController: UIViewController {

    @IBOutlet weak var numCount: UILabel!
    
    @IBOutlet weak var numStepSize: UILabel!
    var count = 0
    var stepSize = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func stepDownTapped(_ sender: Any) {
        if stepSize == 1{
            return
        }else{
            stepSize = stepSize - 1
            if(stepSize == 1){
                numStepSize.text = "\(stepSize) Candy at a time"
            }else{
             numStepSize.text = "\(stepSize) Candies at a time"
            }
        }
    }
    
    @IBAction func stepUpTapped(_ sender: Any) {
            stepSize = stepSize + 1
            numStepSize.text = "\(stepSize) Candies at a time"
    }
    @IBAction func plusClicked(_ sender: Any) {
        count = count + stepSize
        numCount.text = "\(count)"
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        count = count - stepSize
        numCount.text = "\(count)"
    }
}

 
