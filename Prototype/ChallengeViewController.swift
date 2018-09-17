//
//  ChallengeViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-09-15.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit
import Firebase

class ChallengeViewController: UIViewController {
    
    
    
    @IBOutlet weak var info: UILabel!
    
    @IBOutlet weak var num1: UILabel!
    
    @IBOutlet weak var num2: UILabel!
    
    @IBOutlet weak var num3: UILabel!
    
    @IBOutlet weak var operator1: UILabel!
    
    @IBOutlet weak var operator2: UILabel!
    
    @IBOutlet weak var equalSymbol: UILabel!
    
    @IBOutlet weak var solution: DesignableTextField!
    
    @IBOutlet weak var helpBox: UIView!
    
    var timer = Timer()
    
    var answer = ""
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // hide equal symbol
        equalSymbol.isHidden =  true
        
        // hide help box
        helpBox.isHidden = true
        
        fetchChallengeDataFromFirebase();
    }
    
    func fetchChallengeDataFromFirebase(){
        ref = Database.database().reference()
        if let user = Auth.auth().currentUser{
            ref?.child("users").child((user.uid)).child("challenge").observeSingleEvent(of: .value, with: { (snapshot) in
                
                let value = snapshot.value as? NSDictionary
                
                let type = value?["type"] as? String ?? ""
                let module = value?["module"] as? String ?? ""
                
                
                if let info = value?["info"] as? String {
                    self.info.text = "\(info)"
                }
                
                if let num1 = value?["num1"] as? Int {
                    self.num1.text = "\(num1)"
                }
                
                if let num2 = value?["num2"] as? Int {
                    self.num2.text = "\(num2)"
                }
                
                if let num3 = value?["num3"] as? Int {
                    self.num3.text = "\(num3)"
                }
                
                if let operator1 = value?["operator1"] as? String {
                    self.operator1.text = "\(operator1)"
                }
                
                if let operator2 = value?["operator2"] as? String {
                    self.operator2.text = "\(operator2)"
                }
                
                if let answer = value?["answer"] as? Int {
                    self.answer = "\(answer)"
                }
            
                // show equal symbol
                self.equalSymbol.isHidden =  false
            })
        }
    }
    
    @IBAction func helpClicked(_ sender: UIButton) {
        helpBox.isHidden = false
        helpBox.alpha = 0.0
        // fade in
        UIView.animate(withDuration: 2.0, animations: {
            self.helpBox.alpha = 1.0
        })
        
        scheduledTimerWithTimeInterval()
    }
    
    func scheduledTimerWithTimeInterval(){
            // Scheduling timer to Call the function "updateCounting" with the interval of 1 seconds
            timer = Timer.scheduledTimer(timeInterval: 6, target: self, selector: #selector(self.fadeOut), userInfo: nil, repeats: false)
    }

    @objc func fadeOut(){
        // fade out
        UIView.animate(withDuration: 2.0, animations: {
            self.helpBox.alpha = 0.0
        })
    }
   
}
