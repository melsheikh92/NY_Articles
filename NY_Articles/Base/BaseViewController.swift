//
//  BaseViewController.swift
//  NY_Articles
//
//  Created by msheikh on 3/20/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import UIKit
import SVProgressHUD
import TTGSnackbar
class BaseViewController : UIViewController , Routable {
    
    func showLoading(){
        SVProgressHUD.show()
    }
    
    func hideLoading(){
        SVProgressHUD.dismiss()
        
    }
    func showSneakBar(_ msg:String){
        let snackbar = TTGSnackbar(message: msg, duration: .middle)
        snackbar.show()
    }
}
