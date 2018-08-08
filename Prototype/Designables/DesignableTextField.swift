//
//  ShakingTextField.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-06-27.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

@IBDesignable
class DesignableTextField: UITextField {

    @IBInspectable var leftImage: UIImage?{
        didSet{
            updateView()
        }
    }
    
    func updateView(){
        if let image = leftImage {
            leftViewMode = .always
            
            // Create a new imageView
            let imageView = UIImageView(frame: CGRect(x: 6, y: 0, width: 24, height: 24))
            imageView.image = image
            
            // Create a new UIView
            let view  = UIView(frame: CGRect(x: 0, y: 0, width: 36 , height: 24))
            
            // add imageView to the UIView
            view.addSubview(imageView)
            
            // assign that view to the left view of the Text Field
            leftView = view
        }else{
            leftViewMode = .never
        }
    }
    
    
    func shake(){
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.5
        animation.repeatCount = 2
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4, y: self.center.y))
        
        self.layer.add(animation, forKey: "position")
    }
    
  
    
}
