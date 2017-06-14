//
//  CheckOutViewModel.swift
//  BasketPrice
//
//  Created by Daniel Vela on 12/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import UIKit

protocol CheckOutViewModelProtocol {
	var numberOfRows: [Int] { get }
	var numberOfRowsDidChange: ((CheckOutViewModelProtocol) -> Void)? { get set }

	var totaAmount: String? { get }
	var totaAmountDidChange: ((CheckOutViewModelProtocol) -> Void)? { get set }

    func title(for row: Int, in component: Int) -> String?
    func calculateAmount(for row: Int, in component: Int)

    init(basket: Basket)
}

class CheckOutViewModel: CheckOutViewModelProtocol {
    var basket: Basket
    var amountInDollars: Float
    var currencies: [Currency]
    var service: CurrencyLayerService?

    required init(basket: Basket) {
        numberOfRows = [0]
        totaAmount = nil
        self.basket = basket
        self.currencies = []

        // Initial value will be in dollars
        self.amountInDollars = basket.calculateTotal()

        self.totaAmount = CurrencyHelper.format(self.amountInDollars,
                                                currencyCode: "USD")

        self.downloadCurrencies()
    }

    func downloadCurrencies() {
        service = CurrencyLayerServiceFactory().createCLService()

        service?.listAllCurrencies(onOK: { (currencies) in
            let orderDescending: (Currency, Currency) -> Bool = { $0.code < $1.code }
            self.currencies = currencies.sorted(by: orderDescending)
            self.numberOfRows = [currencies.count]
        }, onError: { (info) in
            UIViewController.showAlertOnTopController(info)
        })
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
        guard currencies.count > row else {
            return nil
        }
        let currency = currencies[row]
        return currency.code // + " " + currency.description
    }

    func calculateAmount(for row: Int, in component: Int) {
        guard currencies.count > row else {
            return
        }

        totaAmount = nil

        if let service = self.service {
            service.cancel()
        } else {
            service = CurrencyLayerServiceFactory().createCLService()
        }

        let fromCurrency = Currency(code: "USD", description: "")
        let toCurrency = currencies[row]
        service?.liveRates(from: fromCurrency,
                           to: [toCurrency],
                           onOK: { [unowned self](currencyRate) in
                            guard currencyRate.count == 1 else {
                                self.totaAmount = "ERROR"
                                UIViewController.showAlertOnTopController("Invalid currency rate data")
                                return
                            }
                            let rate = currencyRate[0]
                            let convertedAmount = rate.convert(from: self.amountInDollars)
                            self.totaAmount = CurrencyHelper.format(convertedAmount,
                                                                    currencyCode: toCurrency.code)
        }, onError: { (info) in
            self.totaAmount = "ERROR"
            UIViewController.showAlertOnTopController(info)
        })
    }
}
