//
//  BaseViewController.swift
//  NY_Articles
//
//  Created by msheikh on 3/20/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import UIKit
class BaseViewController : UIViewController , Routable {
    
    override func viewDidLoad() {
    
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        
        
    }
    
    
    func showLoading(){
        LoadingHelper.shared.showLoading()
    }
    
    func hideLoading(){
        LoadingHelper.shared.hideLoading()
    }
}
