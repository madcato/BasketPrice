//
//  GoodListTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class GoodListTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLoad() {
        let list = GoodList.load()
        XCTAssertNotNil(list, "GoodList load must return and array")
        XCTAssertGreaterThan((list?.count)!, 0, "GoodList load must return more than one element")
        if let element = list?[0] {
            XCTAssertNotEqual(element.name, "", "GoodList load must return valid Good")
            XCTAssertNotEqual(element.price, 0.0, "GoodList load must return valid Good")
            XCTAssertNotEqual(element.package, "", "GoodList load must return valid Good")
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
