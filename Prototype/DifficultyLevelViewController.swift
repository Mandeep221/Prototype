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
        
        // save difficulty level to use in later screens
         UserDefaults.standard.set(difficultyLevel, forKey: moduleType)
        
        // launch module
        switch moduleType {
        case "counting":
            self.performSegue(withIdentifier: "countingSegue", sender: nil)
            break
        case "addsub":
            self.performSegue(withIdentifier: "addsubSegue", sender: nil)
            break
        case "muldiv":
            break
        default:
            print("Something wrong with module selection, cant launch!")
        }
    }
}
