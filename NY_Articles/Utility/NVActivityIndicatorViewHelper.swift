//
//  NVActivityIndicatorViewHelper.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import NVActivityIndicatorView
class LoadingHelper {
    
    static let shared = LoadingHelper()
    
    private init(){}
    
    private   var activityData:ActivityData = ActivityData(
        size: CGSize(width: 70, height: 70),
        message: nil,
        messageFont: UIFont.systemFont(ofSize: 18, weight: .regular),
        type: .ballClipRotatePulse,
        color:R.color.primaryColor.getUIcolor(),
        padding: 0,
        displayTimeThreshold: 1,
        minimumDisplayTime: nil,
        backgroundColor: UIColor(white: 0.5, alpha: 0.08),
        textColor:  R.color.primaryColor.getUIcolor() )
    
     func showLoading(){
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(self.activityData, nil)
        
    }
    func hideLoading(){
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating(nil)
        
    }
}
