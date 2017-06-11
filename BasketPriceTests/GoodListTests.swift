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

    func testFailLoad() {
        let list = GoodList.load(fromFile: "GoodListFail")
        XCTAssertNil(list, "GoodList load must fail for an incorrect file name")
    }
    
    func testLoadEmpty() {
        let list = GoodList.load(fromFile: "GoodListFake")
        XCTAssertNotNil(list, "GoodList load must return and array")
        XCTAssertGreaterThan((list?.count)!, 0, "GoodList load must return more than one element")
        if let element = list?[0] {
            XCTAssertEqual(element.name, "", "GoodList load must return an empty Good")
            XCTAssertEqual(element.price, 0.0, "GoodList load must return an empty Good")
            XCTAssertEqual(element.package, "", "GoodList load must return an empty Good")
        }
    }

    func testFailLoadProperty() {
        let list = PropertyListHelper.loadArray(fromFile: "GoodListFail") as? [[String: Any]]
        XCTAssertNil(list, "GoodList load must fail for an incorrect file name")
    }
}
