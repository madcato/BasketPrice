//
//  AppDelegateTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class AppDelegateTests: XCTestCase {
    
    var appDelegate: AppDelegate?

    override func setUp() {
        super.setUp()
        appDelegate = UIApplication.shared.delegate as? AppDelegate
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testLifeCycle() {
        appDelegate?.applicationWillResignActive(UIApplication.shared)

        appDelegate?.applicationDidEnterBackground(UIApplication.shared)
        
        appDelegate?.applicationWillEnterForeground(UIApplication.shared)

        appDelegate?.applicationDidBecomeActive(UIApplication.shared)

        appDelegate?.applicationWillTerminate(UIApplication.shared)
    }
}
