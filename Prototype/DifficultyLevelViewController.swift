//
//  DifficultyLevelViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-09-10.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class DifficultyLevelViewController: UIViewController {
    
    var moduleType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(moduleType)")
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func gradeOneClicked(_ sender: UIButton) {
    }
    
    @IBAction func gradeTwoClicked(_ sender: UIButton) {
    }
    
    @IBAction func gradeThreeClicked(_ sender: UIButton) {
    }
    
    @IBAction func dismissDialog(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
    }
}
