//
//  GoodListTableViewCellTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class GoodListTableViewCellTests: XCTestCase {

    var cell: GoodListTableViewCell?

    override func setUp() {
        super.setUp()
        cell = GoodListTableViewCell()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testAwake() {
        cell?.awakeFromNib()
    }

    func testSelected() {
        cell?.setSelected(true, animated: true)
    }

    func testStepperChanged() {
        cell?.qtyStepperChanged(UIStepper())
    }
}
