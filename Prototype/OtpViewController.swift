//
//  OtpViewController.swift
//  
//
//  Created by Mandeep Sarangal on 2018-08-23.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class OtpViewController: UIViewController {

    
    @IBOutlet weak var txtOne: UITextField!
    @IBOutlet weak var txtTwo: UITextField!
    @IBOutlet weak var txtThree: UITextField!
    @IBOutlet weak var txtFour: UITextField!
    @IBOutlet weak var txtFive: UITextField!
    @IBOutlet weak var txtSix: UITextField!
   
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Reference to Firebase database
        ref = Database.database().reference()
        
        txtOne.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
         txtTwo.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
         txtThree.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
         txtFour.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
         txtFive.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
         txtSix.addTarget(self, action: #selector(self.textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        txtOne.becomeFirstResponder()
    }

    @objc func textFieldDidChange(textField: UITextField){
        let text = textField.text
        if text?.utf16.count == 1{
            switch textField{
            case txtOne:
                txtTwo.becomeFirstResponder()
            case txtTwo:
                txtThree.becomeFirstResponder()
            case txtThree:
                txtFour.becomeFirstResponder()
            case txtFour:
                txtFive.becomeFirstResponder()
            case txtFive:
                txtSix.becomeFirstResponder()
            case txtSix:
                txtSix.resignFirstResponder()
            default:
                break
            }
        }
    }
    
    @IBAction func verifyOtp(_ sender: DesignableButton) {
        let defaults = UserDefaults.standard
        let credentials: PhoneAuthCredential = PhoneAuthProvider.provider().credential(withVerificationID: defaults.string(forKey: "authVID")!, verificationCode: getCode())
        
        Auth.auth().signIn(with: credentials) { (user, error) in
            if error != nil{
                print("error: \(error?.localizedDescription)")
            }else{
                // Success Scenario
                
                //check if user is returning or new
                self.ref?.child("users").child((user?.uid)!).child("mobile").observeSingleEvent(of: .value, with: {(snap) in
                    
                    if snap.exists(){
                        
                        // User mobile number already in DB, So user is returing
                        print("Returing User")
                    }else{
                        //Phone number not available, User is new
                        print("New User")
                        self.ref?.child("users").child((user?.uid)!).child("mobile").setValue(user?.phoneNumber)
                    }
                })

                
                // #TODO: Remove this extra code later on
                // Display user information
                print("phone number: \(user?.phoneNumber)")
                let userInfo = user?.providerData[0]
                
                print("Provider Id: \(userInfo?.providerID)")
            
                // to home screen
                //self.performSegue(withIdentifier: "verifiedUserSegue", sender: nil)
                let kAppDelegate = UIApplication.shared.delegate as! AppDelegate
                kAppDelegate.showHomeViewController()
            }
        }
    }
    
    func getCode() -> String {
        return txtOne.text! + txtTwo.text! + txtThree.text! + txtFour.text! + txtFive.text! + txtSix.text!
    }
    
}
