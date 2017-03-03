//
//  RateLimitTests.swift
//  SendGrid
//
//  Created by Scott Kawai on 6/20/16.
//  Copyright © 2016 Scott Kawai. All rights reserved.
//

import XCTest
@testable import SendGrid

class RateLimitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStaticInitializer() {
        let url = URL(fileURLWithPath: "/foo")
        let headers: [String:String] = [
            "X-RateLimit-Limit": "500",
            "X-RateLimit-Remaining": "499",
            "X-RateLimit-Reset": "1466435354"
        ]
        let response = HTTPURLResponse(url: url, statusCode: 200, httpVersion: nil, headerFields: headers)
        
        guard let info = RateLimit.rateLimitInfo(from: response) else
        {
            XCTFail("Received `nil` from Rate limit initializer.")
            return
        }
        
        XCTAssertEqual(info.limit, 500)
        XCTAssertEqual(info.remaining, 499)
        XCTAssertEqual(info.resetDate.timeIntervalSince1970, 1466435354)
    }
    
}
