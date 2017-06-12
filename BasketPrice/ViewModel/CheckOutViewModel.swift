//
//  CheckOut.swift
//  <# @projectName #>
//
//  Created by Daniel Vela on 12/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

protocol CheckOutViewModelProtocol {
	var numberOfRows: [Int] { get }
	var numberOfRowsDidChange: ((CheckOutViewModelProtocol) -> Void)? { get set }

	var totaAmount: String? { get }
	var totaAmountDidChange: ((CheckOutViewModelProtocol) -> Void)? { get set }

    func title(for row: Int, in component: Int) -> String?

    init(basket: Basket)
}

class CheckOutViewModel: CheckOutViewModelProtocol {
    var basket: Basket
    var amountInDollars: Float
    var currencies: [Currency]

    required init(basket: Basket) {
        numberOfRows = []
        totaAmount = nil
        self.basket = basket
        self.currencies = []

        // FIXME Download currencies

        // Initial value will be in dollars
        self.amountInDollars = basket.calculateTotal()
        if let amountStr = CurrencyHelper.format(amountInDollars,
                                                 currencyCode: "USD") {
            self.totaAmount = amountStr
        }
    }

    var numberOfRows: [Int] {
        didSet {
            self.numberOfRowsDidChange?(self)
        }
    }
    var numberOfRowsDidChange: ((CheckOutViewModelProtocol) -> Void)?

    var totaAmount: String? {
        didSet {
            self.totaAmountDidChange?(self)
        }
    }
    var totaAmountDidChange: ((CheckOutViewModelProtocol) -> Void)?

    func title(for row: Int, in component: Int) -> String? {
        return currencies[row].symbol
    }
}
