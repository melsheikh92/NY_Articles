//
//  Router.swift
//  NY_Articles
//
//  Created by msheikh on 3/20/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import UIKit
protocol Routable {
    
}

extension Routable where Self: UIViewController {
    
    
    func startController(vc:UIViewController,prsentation: Presentation? = .push,identifier: String? = nil, animated: Bool = true, modalPresentationStyle: UIModalPresentationStyle? = nil, configure: ((UIViewController) -> Void)? = nil, completion: ((UIViewController) -> Void)? = nil) {
        
        
        if let modalPresentationStyle = modalPresentationStyle {
            vc.modalPresentationStyle = modalPresentationStyle
        }
        
        configure?(vc)
        
        if(prsentation == .present ){
            present(vc, animated: animated) {
                completion?(vc)
            }
        }else {
            self.navigationController?.pushViewController(vc, animated: animated)
        }
    }
    
    
}
enum Presentation{
    case present
    case push
}
