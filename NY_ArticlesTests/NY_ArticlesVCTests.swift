//
//  NY_ArticlesTests.swift
//  NY_ArticlesTests
//
//  Created by Mahmoud on 3/19/19.
//  Copyright © 2019 Mahmoud. All rights reserved.
//

import XCTest
import Rswift
import RxCocoa
import SVProgressHUD
@testable import NY_Articles

class NY_ArticlesTests: XCTestCase {
    
    var vc :MainViewController!
    
    override func setUp() {
        vc = MainViewController()
        
    }
    
    func testViewModel(){
        XCTAssertNotNil(vc.viewModel)
    }
    
    func testProgressStatus(){
        vc.viewModel.loadArticles()
        XCTAssertTrue(SVProgressHUD.isVisible())
    }
    
    
    override func tearDown() {
        vc = nil
    }
}
