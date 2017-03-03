//
//  SessionTests.swift
//  SendGrid
//
//  Created by Scott Kawai on 6/10/16.
//  Copyright © 2016 Scott Kawai. All rights reserved.
//

import XCTest
@testable import SendGrid

class SessionTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testSendWithoutAuth() {
        let session = Session()
        let personalization = [Personalization(recipients: "test@example.com")]
        let email = Email(personalizations: personalization, from: Address("foo@bar.com"), content: [Content.plainTextContent("plain")], subject: "Hello World")
        do {
            try session.send(request: email)
            XCTFail("Expected failure when sending a request without authentication, but nothing was thrown.")
        } catch {
            XCTAssertEqual("\(error)", SGError.Session.authenticationMissing.description)
        }
    }

}
