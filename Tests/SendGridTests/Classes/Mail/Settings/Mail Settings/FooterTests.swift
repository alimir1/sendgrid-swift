//
//  FooterTests.swift
//  SendGrid
//
//  Created by Scott Kawai on 5/15/16.
//  Copyright © 2016 Scott Kawai. All rights reserved.
//

import XCTest
@testable import SendGrid

class FooterTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testInitialization() {
        let foot = Footer(enable: true, text: "A footer", html: "<h1>A footer</h1>")
        XCTAssertTrue(foot.enable)
        XCTAssertEqual(foot.text, "A footer")
        XCTAssertEqual(foot.html, "<h1>A footer</h1>")
    }
    
    func testJSONValue() {
        let foot = Footer(enable: false, text: "A footer", html: "<h1>A footer</h1>")
        XCTAssertEqual(foot.jsonValue, "{\"footer\":{\"text\":\"A footer\",\"html\":\"<h1>A footer<\\/h1>\",\"enable\":false}}")
    }

}
