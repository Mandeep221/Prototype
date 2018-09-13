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
    
    var onLevelSelected: ((_ data: Int) -> ())?
    
    @IBAction func gradeOneClicked(_ sender: UIButton) {
        saveLevelAndLaunchModule(difficultyLevel: 1)
    }
    
    @IBAction func gradeTwoClicked(_ sender: UIButton) {
        saveLevelAndLaunchModule(difficultyLevel: 2)
    }
    
    @IBAction func gradeThreeClicked(_ sender: UIButton) {
        saveLevelAndLaunchModule(difficultyLevel: 3)
    }
    
    @IBAction func dismissDialog(_ sender: UIButton) {
         dismiss(animated: true, completion: nil)
    }
    
    func saveLevelAndLaunchModule(difficultyLevel: Int){
        // pass the level back to the home page
        onLevelSelected?(difficultyLevel)
        // dism
       dismiss(animated: false, completion: nil)
    }
}
