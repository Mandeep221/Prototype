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
    
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func plusClicked(_ sender: Any) {
        count = count + 1
        numCount.text = "\(count)"
    }
    
    @IBAction func minusTapped(_ sender: Any) {
        count = count - 1
        numCount.text = "\(count)"
    }
}

 