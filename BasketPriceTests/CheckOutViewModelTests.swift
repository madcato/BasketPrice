//
//  CheckOutViewModelTests.swift
//  BasketPrice
//
//  Created by Daniel Vela on 15/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
@testable import BasketPrice

class MockCurrencyLayerService: CurrencyLayerService {
    override func listAllCurrencies(onOK: @escaping ([Currency]) -> Void,
                           onError: @escaping (String) -> Void) {
        let currencies = [Currency(code: "EUR", description: "Euros"),
                          Currency(code: "USD", description: "US Dollar")]
        onOK(currencies)
    }
    
    override func liveRates(from currency: Currency,
                   to quotes: [Currency],
                   onOK: @escaping ([CurrencyRate]) -> Void,
                   onError: @escaping (String) -> Void) {
        let quote = [CurrencyRate(quote: "USDEUR", rate: 1.2)]
        onOK(quote)
    }
}

class CheckOutViewModelTests: XCTestCase {

    var viewModel: CheckOutViewModel?
    var good1 = Good(name: "Pea", price: 1.2, package: "bag")
    var good2 = Good(name: "Bread", price: 0.7, package: "bar")
    var good3 = Good(name: "Butter", price: 2.7, package: "bottle")
    var basket = Basket()
    var mockService:MockCurrencyLayerService?

    override func setUp() {
        super.setUp()
        let request = HttpRequest()
        let api = HttpAPI(request)
        mockService = MockCurrencyLayerService(api)

        InjectionMap.networking = mockService!
        basket.add(good1, qty: 1)
        basket.add(good2, qty: 2)
        basket.add(good3, qty: 3)
        viewModel = CheckOutViewModel(basket: basket)
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testTotalAmount() {
        XCTAssertEqual(viewModel?.totaAmount, "$10.70", "CheckOutViewModel: totalAmount fail")
    }

    func testTitle() {
        XCTAssertEqual(viewModel?.title(for: 0, in: 0), "EUR", "CheckOutViewModel: title fail")
        XCTAssertNil(viewModel?.title(for: 10, in: 0), "CheckOutViewModel: title must return nil if row > count")
    }

    func testCalculateAmount() {
        viewModel?.calculateAmount(for: 0, in: 0)
        XCTAssertEqual(viewModel?.totaAmount, "€12.84", "CheckOutViewModel: calculateAmount")
    }
}
