//
//  Login.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-08-07.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var phoneNumber: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // hide auto correct 
        phoneNumber.autocorrectionType = .no
        
        // numbers only
        self.phoneNumber.keyboardType = UIKeyboardType.decimalPad
        
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if range.length + range.location > (phoneNumber.text?.characters.count)!{
            return false
        }
        
        let newLength = (phoneNumber.text?.characters.count)! + string.characters.count - range.length
        
        return newLength <= 10
    }
}
