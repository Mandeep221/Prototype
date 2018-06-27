//
//  ShakingTextField.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-06-27.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

class ShakingTextField: UITextField {

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
