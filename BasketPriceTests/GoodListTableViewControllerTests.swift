//
//  GoodListTableViewController.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class GoodListTableViewControllerTest: XCTestCase {
    
    var controller: GoodListTableViewController?

    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle(for: type(of: self)))
        controller = storyboard.instantiateViewController(withIdentifier: "GoodListTableViewController")
            as? GoodListTableViewController
        let _ = controller?.tableView
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testMemoryWarning() {
        controller?.didReceiveMemoryWarning()
    }
}
