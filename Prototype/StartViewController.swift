//
//  StartViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-08-22.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

   
    @IBAction func getVerified(_ sender: DesignableButton) {
        performSegue(withIdentifier: "getVerifiedSegue", sender: nil)
    }
    
    
    @IBAction func continueAsGuest(_ sender: DesignableButton) {
        performSegue(withIdentifier: "homeSegue", sender: nil)
    }
}
