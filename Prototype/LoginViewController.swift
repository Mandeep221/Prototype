//
//  Login.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-08-07.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var phoneNumber: UITextField!
    
    @IBAction func sendOtp(_ sender: DesignableButton) {
        
        let alert = UIAlertController(title: "Phone number", message: "An OTP will be sent to \n \(phoneNumber.text!)", preferredStyle: .alert)

        let sendOtp = UIAlertAction(title: "Send OTP", style: .default) { (UIAlertAction) in
            PhoneAuthProvider.provider().verifyPhoneNumber("+1"+self.phoneNumber.text!) { (verificationId, error) in
                if(error != nil){
                    print("Auth error: \(String(describing: error?.localizedDescription))")
                }else{

                }
            }
        }
        let cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

        alert.addAction(sendOtp)
        alert.addAction(cancel)
        self.present(alert, animated: true, completion: nil)
       // performSegue(withIdentifier: "otpSegue", sender: nil)
    }
    
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
