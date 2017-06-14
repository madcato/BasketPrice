//
//  NetTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class NetTests: XCTestCase {

    var service: CurrencyLayerService?

    override func setUp() {
        super.setUp()
        service = CurrencyLayerServiceFactory().createCLService()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLive() {
        let endQueryExpectation = expectation(description: "EndQueryExpectation")

        service?.listAllCurrencies(onOK: { (currencies) in
            endQueryExpectation.fulfill()
        }, onError: { (description) in
            endQueryExpectation.fulfill()
        })

        wait(for: [endQueryExpectation], timeout: 5.0)
    }
    

    
}
