//
//  MaterialTextField.swift
//  firebase-example
//
//  Created by Nikolai Volochaev on 02/11/15.
//  Copyright © 2015 Nikolai Volochaev. All rights reserved.
//

import UIKit

class MaterialTextField: UITextField {

    override func awakeFromNib() {
        layer.cornerRadius = 2.0
        layer.borderColor  = UIColor(red: UI_SHADOW_COLOR, green: UI_SHADOW_COLOR, blue: UI_SHADOW_COLOR, alpha: 0.1).CGColor
        layer.borderWidth  = 1.0
    }
    
    override func textRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 10)
    }
    
    override func editingRectForBounds(bounds: CGRect) -> CGRect {
        return CGRectInset(bounds, 10, 10)
    }
}
