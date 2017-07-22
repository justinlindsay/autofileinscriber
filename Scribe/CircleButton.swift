//
//  CircleButton.swift
//  Scribe
//
//  Created by Justin Lindsay on 7/21/17.
//  Copyright © 2017 Justin Lindsay. All rights reserved.
//

import UIKit

@IBDesignable
class CircleButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 30.0 {
        
        didSet{
            
            setUpView()
            
        }
        
    }
    
    override func prepareForInterfaceBuilder() {
        
        setUpView()
        
    }
    
    func setUpView() {
        
        layer.cornerRadius = cornerRadius
        
    }
    
    
}
