//
//  UIView.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/21/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import UIKit
@IBDesignable
class RoundedImage :UIImageView
{
    @IBInspectable var isCircle:Bool = false {
        didSet{
            if(isCircle){
                self.toCircle()
            }
        }
    }
    
    @IBInspectable var roundedValue :Double = 0 {
        didSet{
            if(!isCircle){
                self.rounded(value: roundedValue)
            }
        }
    }
    
}
