//
//  HomeViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-05-16.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    var moduleType = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func countingTapped(_ sender: Any) {
        //self.performSegue(withIdentifier: "chooseToySegue", sender: nil)
        moduleType = "counting"
        chooseDifficulty()
    }
    
    @IBAction func addsubtapped(_ sender: Any) {
        moduleType = "addsub"
        chooseDifficulty()
        //self.performSegue(withIdentifier: "addsubsegue", sender: nil)
    }
    
    @IBAction func addTapped(_ sender: Any) {
        moduleType = "add"
        chooseDifficulty()
        //self.performSegue(withIdentifier: "addSegue", sender: nil)
    }
    
    @IBAction func subtractionTapped(_ sender: DesignableButton) {
        moduleType = "sub"
        chooseDifficulty()
        //self.performSegue(withIdentifier: "subSegue", sender: nil)
    }

    func chooseDifficulty(){
        self.performSegue(withIdentifier: "difficultySegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var vc = segue.destination as! DifficultyLevelViewController
        vc.moduleType = self.moduleType
    }
}
