//
//  DesignableButton.swift
//  Prototype
//
//  Created by Mandeep Sarangal on 2018-06-13.
//  Copyright © 2018 Mandeep Sarangal. All rights reserved.
//

import UIKit

@IBDesignable class DesignableButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
}
