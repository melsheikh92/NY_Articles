//
//  File.swift
//  NY_ArticlesTests
//
//  Created by Mahmoud on 3/21/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import Foundation
import XCTest
import PromiseKit
@testable import NY_Articles

class ViewModelTests: XCTestCase {
    
    let viewmodel = ArticlesViewModel()
    
    override func setUp() {
        
    }
    
    func testCheckLoading(){
        viewmodel.loadArticles()
        XCTAssertTrue( viewmodel.isLoading.value)
    }
    
    func testGetArticles(){
        viewmodel.loadArticles {
            XCTAssertTrue(self.viewmodel.articlesSubj.value.count > 0)
        }
    }
    
    func testMsgInitailState(){
        XCTAssertEqual(self.viewmodel.msgSubj.value, "")
    }
    
    func testMsgAfterCall(){
        viewmodel.loadArticles {
            XCTAssertEqual(self.viewmodel.msgSubj.value, "data loaded successfully")
        }
    }
    
    func testPerformanceApiCall() {
        self.measure {
            self.viewmodel.loadArticles()
        }
    }
    
    override func tearDown() {
        
    }
}
