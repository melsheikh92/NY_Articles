//
//  ApiManagerTest.swift
//  NY_ArticlesTests
//
//  Created by Mahmoud on 3/21/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import XCTest
import PromiseKit
@testable import NY_Articles

class ApiManagerTest: XCTestCase {
    
    var apiManager:ApiManager<ArticlesResponse>?
    override func setUp() {
       self.apiManager = ApiManager<ArticlesResponse>()
    }

    func testGetRequestData() {
        apiManager?.getRequest(action: .articles).done({ (response) in
            XCTAssertTrue(response.results?.count ?? 0 >  0)
        })
    
    }
    func testStatus(){
        apiManager?.getRequest(action: .articles).done({ (response) in
            XCTAssertEqual(response.status, "OK")
        })
        
    }
    
    override func tearDown() {
    }

}
