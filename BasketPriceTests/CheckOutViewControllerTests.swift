//
//  CheckOutViewControllerTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class CheckOutViewControllerTests: XCTestCase {

    var controller: CheckOutViewController?

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        controller = storyboard.instantiateViewController(withIdentifier: "CheckOutViewController")
            as? CheckOutViewController
        let _ = controller?.view
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testViewDidLoad() {
        XCTAssertNotNil(controller?.view, "CheckOutViewController not loaded")
    }

    func testMemoryWarning() {
        controller?.didReceiveMemoryWarning()
    }
    
    func testNumberOfComponents() {
        let result = controller?.numberOfComponents(in: (controller?.currenciesPicker)!)
        XCTAssertEqual(result, 1, "Wrong numbers of components in CheckOutViewController")
    }

    func testNumberOfRows() {
        let result = controller?.pickerView((controller?.currenciesPicker)!,
                                            numberOfRowsInComponent: 0)
        XCTAssertEqual(result, 0, "Wrong number of rows in CheckOutViewController")
    }
}
