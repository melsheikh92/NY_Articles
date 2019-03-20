//
//  ArticlesResponse.swift
//  NY_Articles
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
class ArticlesResponse : BaseModel{
    var results : [Article]?
    
    enum ResKeys: String, CodingKey {
        case results = "results"
    }
    
    required init(from decoder: Decoder) throws {
        try super.init(from: decoder)
        let values = try decoder.container(keyedBy: ResKeys.self)
        results = try values.decodeIfPresent([Article].self, forKey: .results)

    }
    
    

}
