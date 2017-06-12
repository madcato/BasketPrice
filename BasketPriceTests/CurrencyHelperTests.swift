//
//  CurrencyHelper.swift
//  BasketPrice
//
//  Created by Daniel Vela on 12/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class CurrencyHelperTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testDollars() {
        let amountStr = CurrencyHelper.format(4.65,
                                              currencyCode: "USD")
        XCTAssertEqual(amountStr, "$4.65", "Fail converting to dollars")
    }
    
    func testEuros() {
        let amountStr = CurrencyHelper.format(4.65,
                                              currencyCode: "EUR")
        XCTAssertEqual(amountStr, "€4.65", "Fail converting to euros")
    }
}
