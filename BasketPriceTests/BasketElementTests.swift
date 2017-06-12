//
//  BasketElementTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class BasketElementTests: XCTestCase {
    
    var basket: Basket?

    override func setUp() {
        super.setUp()
        basket = Basket()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAdd() {
        let good = Good(name: "Prueba", price: 0.4, package: "pack")
        basket?.add(good, qty: 1)
        var result = basket?.includedElements.index(where: {
            $0.article == good && $0.qty == 1
        })
        XCTAssertTrue(result != nil, "Basket add failed")

        basket?.add(good, qty: 1)
        result = basket?.includedElements.index(where: {
            $0.article == good && $0.qty == 2
        })
        XCTAssertTrue(result != nil, "Basket add failed")

        let good2 = Good(name: "Bean", price: 2.3, package: "bottle")
        basket?.add(good2, qty: 1)
        result = basket?.includedElements.index(where: {
            $0.article == good2 && $0.qty == 1
        })
        XCTAssertTrue(result != nil, "Basket add failed")
    }
    
    func testSubstract() {
        let good = Good(name: "Prueba", price: 0.4, package: "pack")
        basket?.add(good, qty: 2)
        basket?.substract(good, qty: 1)
        var result = basket?.includedElements.index(where: {
            $0.article == good && $0.qty == 1
        })
        XCTAssertTrue(result != nil, "Basket add failed")
        
        basket?.substract(good, qty: 1)
        result = basket?.includedElements.index(where: {
            $0.article == good
        })
        XCTAssertTrue(result == nil, "Basket add failed")
    }

    func testQty() {
        let good = Good(name: "Prueba", price: 0.4, package: "pack")
        basket?.add(good, qty: 2)
        let qty = basket?.qty(for: good)
        XCTAssertEqual(qty, 2, "Basket qty failed")
    }
    
    func testUpdate() {
        let good = Good(name: "Prueba", price: 0.4, package: "pack")
        basket?.update(good, qty: 2)
        var result = basket?.includedElements.index(where: {
            $0.article == good && $0.qty == 2
        })
        XCTAssertTrue(result != nil, "Basket update 1 failed")
        
        basket?.update(good, qty: 3)
        result = basket?.includedElements.index(where: {
            $0.article == good && $0.qty == 3
        })
        XCTAssertTrue(result != nil, "Basket update 2 failed")
    }
}
