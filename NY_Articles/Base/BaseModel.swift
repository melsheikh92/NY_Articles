//
//  BaseModel.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
class BaseModel:  Codable {
    let status : String?
    let copyright : String?
    let num_results : Int?
    
    enum CodingKeys: String, CodingKey {
        
        case status = "status"
        case copyright = "copyright"
        case num_results = "num_results"
    }
    
    required init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        status = try values.decodeIfPresent(String.self, forKey: .status)
        copyright = try values.decodeIfPresent(String.self, forKey: .copyright)
        num_results = try values.decodeIfPresent(Int.self, forKey: .num_results)
    }
    
}
