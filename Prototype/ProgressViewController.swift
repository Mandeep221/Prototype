//
//  ProgressViewController.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-09-19.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class ProgressViewController: UIViewController {

    
    @IBOutlet weak var countingDateOne: UILabel!
    @IBOutlet weak var countingDateTwo: UILabel!
    @IBOutlet weak var countingDateThree: UILabel!
    @IBOutlet weak var countingDurationOne: UILabel!
    @IBOutlet weak var countingDurationTwo: UILabel!
    @IBOutlet weak var countingDurationThree: UILabel!
    
    @IBOutlet weak var addSubDateOne: UILabel!
    @IBOutlet weak var addSubDateTwo: UILabel!
    @IBOutlet weak var addSubDateThree: UILabel!
    @IBOutlet weak var addSubDurationOne: UILabel!
    @IBOutlet weak var addSubDurationTwo: UILabel!
    @IBOutlet weak var addSubDurationThree: UILabel!
    
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let formatter = DateFormatter()

        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        let result = formatter.string(from: date)
        
        //print("Date is: \(date)")
        fetchDataFromFirebase()
    }
    
    func fetchDataFromFirebase() {
        
    }

}

