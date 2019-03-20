//
//  ApiManager.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import PromiseKit
import Alamofire

class ApiManager<T : BaseModel>{
    
    
    func getetRequest()-> Promise<T>{
        return Promise{ seal in
            Alamofire.request(API.baseUrl+API.API_KEY).validate().responseData{ (response) in
                switch response.result{
                case .failure(let e):
                    seal.reject(e)
                case .success(let data):
                    let jsonDecoder = JSONDecoder()
                    if let responseModel = try? jsonDecoder.decode(T.self, from: data) {
                        seal.fulfill(responseModel)
                    }else{
                        seal.reject(NSError(domain: "", code: response.response?.statusCode ?? 400, userInfo: nil))
                    }
                }
            }
        }
    }
}


enum APIError : Error{
    case invaild_response
    
    
    
}
