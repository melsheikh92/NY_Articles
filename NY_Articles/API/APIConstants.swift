//
//  API.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation


struct APIConstants {
    static let baseUrl = "https://api.nytimes.com/svc/mostpopular/";
    static let  API_KEY = "?api-key=FqKkAvkmwygbm6LtlQXRwSccIHDkiatW";
    static let version = "v2"
    enum ApiActions  : String{
        case articles = "/mostviewed/all-sections/7.json"
    }    
}

