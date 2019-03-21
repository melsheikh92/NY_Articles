//
//  UIView.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/21/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import UIKit

extension UIView{
    
    func toCircle(){
        self.layer.cornerRadius = self.frame.size.width/2
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 1.0
    }
    
    func rounded(value:Double){
        self.layer.cornerRadius = CGFloat(value)
        self.clipsToBounds = true
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.borderWidth = 0.0
        
    }
    
    func roundedWithBorder(cornerRadius:Double ,borderWidth:Double ,borderColor:UIColor){
        self.layer.cornerRadius = CGFloat(cornerRadius)
        self.clipsToBounds = true
        self.layer.borderColor = borderColor.cgColor
        self.layer.borderWidth = CGFloat(borderWidth)
    }
    
}
