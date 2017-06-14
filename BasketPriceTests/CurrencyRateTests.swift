//
//  CurrencyRateTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class CurrencyRateTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRate() {
        let rate = CurrencyRate(quote: "USDMIA", rate: 0.6)
        let converted = rate.convert(from: 1.2)
        XCTAssertEqual(converted, 0.72, "Fail convert rate")
    }
}
