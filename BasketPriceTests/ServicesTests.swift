//
//  ServicesTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class ServicesTests: XCTestCase {

    var service: CurrencyLayerService?
    var request: HttpRequest?

    override func setUp() {
        super.setUp()
        service = CurrencyLayerServiceFactory().createCLService()
        request = HttpRequest()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLive() {
        let endQueryExpectation = expectation(description: "EndQueryExpectation")

        service?.listAllCurrencies(onOK: { (currencies) in
            XCTAssertGreaterThan(currencies.count, 0, "Server doesn't respond anything")
            endQueryExpectation.fulfill()
        }, onError: { (description) in
            XCTAssert(false, description)
            endQueryExpectation.fulfill()
        })

        wait(for: [endQueryExpectation], timeout: 5.0)
    }
    
    func testMissignAccessKeyParameter() {
        let endQueryExpectation = expectation(description: "EndBadQueryExpectation")

        let url = "http://apilayer.net/api/list"
        let httpData = HttpRequestData(method: .get,
                                       url: url,
                                       parameters: nil,
                                       headers: nil)
        request?.start(httpData: httpData,
                      onOK: { (object) -> Void in
                        if let json = object as? [String: Any],
                            let error = json["error"] as? [String: Any],
                            let code = error["code"] as? Int,
                            let info = error["info"] as? String {
                            XCTAssertEqual(code, 101, "Bad error code for access_key")
                            XCTAssertEqual(info,
                                           "You have not supplied an API Access Key. [Required format: access_key=YOUR_ACCESS_KEY]",
                                           "Bad error info for access_key")
                        } else {
                            XCTAssert(false, "Bad format")
                        }
                        endQueryExpectation.fulfill()
                      },
                      onError: { (_, errorDesc) in
                        XCTAssertFalse(false, errorDesc)
                        endQueryExpectation.fulfill()
                        })


        wait(for: [endQueryExpectation], timeout: 5.0)
    }

    func testbadServer() {
        let endQueryExpectation = expectation(description: "EndBadQueryExpectation")

        let url = "http://apilayasser.net/api/list"
        let httpData = HttpRequestData(method: .get,
                                       url: url,
                                       parameters: nil,
                                       headers: nil)
        request?.start(httpData: httpData,
                       onOK: { (object) -> Void in
                        XCTAssert(false, "Bad call")
                        endQueryExpectation.fulfill()
        },
                       onError: { (code, errorDesc) in
                        XCTAssertEqual(code, 0, "Bad server")
                        endQueryExpectation.fulfill()
        })


        wait(for: [endQueryExpectation], timeout: 5.0)
    }
}
