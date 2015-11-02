//
//  MaterialView.swift
//  firebase-example
//
//  Created by Nikolai Volochaev on 02/11/15.
//  Copyright © 2015 Nikolai Volochaev. All rights reserved.
//

import UIKit

class MaterialView: UIView {

    override func awakeFromNib() {
        layer.cornerRadius  = 2.0
        layer.shadowColor   = UIColor(red: UI_SHADOW_COLOR, green: UI_SHADOW_COLOR, blue: UI_SHADOW_COLOR, alpha: 0.5).CGColor
        layer.shadowOpacity = 0.9
        layer.shadowRadius  = 5.0
        layer.shadowOffset  = CGSizeMake(0.0, 1.0)
    }
    
}
