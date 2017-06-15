//
//  GoodListViewModelTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 15/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class GoodListViewModelTests: XCTestCase {

    var viewModel: GoodListViewModel?
    var good1 = Good(name: "Pea", price: 1.2, package: "bag")
    var good2 = Good(name: "Bread", price: 0.7, package: "bar")
    var good3 = Good(name: "Butter", price: 2.7, package: "bottle")
    var basket = Basket()

    override func setUp() {
        super.setUp()
        let goodList = [good1, good2]
        
        viewModel = GoodListViewModel(data: goodList, basket: basket)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testSections() {
        XCTAssertEqual(viewModel?.numberOfSections, 1, "GoodListViewModelTests: bad number of sections")
    }

    func testRowsPerSection() {
        XCTAssertEqual(viewModel?.rowsPersection[0], 2, "GoodListViewModelTests: bad number of rowPerSections")
    }

    func testQty() {
        XCTAssertEqual(viewModel?.qty(for: good1), 0, "GoodListViewModelTests: must return 0 if there is no one")
    }

    func testDataForCell() {
        let cell1 = viewModel?.dataForCell(section: 0, row: 0)
        XCTAssertEqual(cell1 as? Good, good1, "GoodListViewModelTests: dataForCell fail")
        
        let cell2 = viewModel?.dataForCell(section: 0, row: 4)
        XCTAssertNil(cell2, "GoodListViewModelTests: dataForCell fail")
    }
 
    func testUpdate() {
        viewModel?.update(good: good1, qty: 2)
        XCTAssertEqual(basket.includedElements.count, 1, "GoodListViewModelTests: update fail")
        XCTAssertEqual(basket.calculateTotal(), 2.4, "GoodListViewModelTests: calculateTotal fail")
    }
    
    
}
