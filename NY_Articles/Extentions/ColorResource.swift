//
//  UIColor.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import  Rswift
extension ColorResource{
    func getUIcolor() -> UIColor?{
        return UIColor(named: self.name)
    }
    
}
