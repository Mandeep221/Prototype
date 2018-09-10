//
//  OtpViewController.swift
//  
//
//  Created by Mandeep Sarangal on 2018-08-23.
//

import UIKit

class OtpViewController: UIViewController {

    
    @IBOutlet weak var txtOne: UITextField!
    @IBOutlet weak var txtTwo: UITextField!
    @IBOutlet weak var txtThree: UITextField!
    @IBOutlet weak var txtFour: UITextField!
    @IBOutlet weak var txtFive: UITextField!
    @IBOutlet weak var txtSix: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
}
