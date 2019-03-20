//
//  API.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation


struct API {
    
    static let baseUrl = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api-key=";
    static let  API_KEY = "FqKkAvkmwygbm6LtlQXRwSccIHDkiatW";
    static let version = ""
    
    enum ApiActions  : String{
        case articles = ""
    }
    
}

