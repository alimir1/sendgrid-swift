//
//  RequestTests.swift
//  SendGrid
//
//  Created by Scott Kawai on 6/20/16.
//  Copyright © 2016 Scott Kawai. All rights reserved.
//

import XCTest
@testable import SendGrid

class RequestTests: XCTestCase {
    
    class Foo: Request {
        
        var endpoint: String = "foo/bar"
        
        var messageHeaders: [String : String] = [:]
        
        var parameters: [AnyHashable:Any]? = ["q":"1"]
        
        func request(for session: Session, onBehalfOf: String?) throws -> URLRequest {
            return URLRequest(url: URL(fileURLWithPath: "/foo"))
        }
        
        func validate() throws {}
    }

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testDefaultValues() {
        let bar = Foo()
        
        // Default method is "GET"
        XCTAssertEqual(bar.method.rawValue, HTTPMethod.GET.rawValue)
        
        // Default Content-Type is form URL encoded.
        XCTAssertEqual(bar.contentType.description, ContentType.formUrlEncoded.description)
        
        // Default accept type is JSON.
        XCTAssertEqual(bar.acceptType.description, ContentType.json.description)
        
        // Default description should be an API blueprint.
        XCTAssertEqual(bar.description, "# GET /foo/bar?q=1\n\n+ Request (application/x-www-form-urlencoded)")
    }

}
