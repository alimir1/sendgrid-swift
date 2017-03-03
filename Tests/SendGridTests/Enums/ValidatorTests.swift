//
//  ValidatorTests.swift
//  SendGrid
//
//  Created by Scott Kawai on 5/17/16.
//  Copyright © 2016 Scott Kawai. All rights reserved.
//

import XCTest
@testable import SendGrid

class ValidatorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testEmail() {
        let good = Validator.email("test@example.com")
        let bad = Validator.email("test@examplecom")
        
        XCTAssertTrue(good.valid)
        XCTAssertFalse(bad.valid)
    }
    
    func testSubscriptionTrackingText() {
        let good = Validator.subscriptionTrackingText("This is <% a test %>")
        let bad = Validator.subscriptionTrackingText("This is a test")
        
        XCTAssertTrue(good.valid)
        XCTAssertFalse(bad.valid)
    }
    
    func testOther() {
        let good = Validator.other(input: "Hello world", pattern: ".+")
        let bad = Validator.other(input: "Hello World", pattern: "(")
        
        XCTAssertTrue(good.valid)
        XCTAssertFalse(bad.valid)
    }

}
