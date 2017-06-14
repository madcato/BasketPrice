//
//  CurrencyLayerService.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class CurrencyLayerService: Service {
    // Return a list of supported currencies
    func listAllCurrencies(onOK: @escaping ([Currency]) -> Void,
                           onError: @escaping (String) -> Void) {

        api.query(endpoint: "list",
                  parameters: nil,
                  onOK: { (result) -> Void in
                    var currencies: [Currency] = []
                    if let json = result as? [String: Any?] {
                        if let currenciesObject = json["currencies"] as? [String: String] {
                            for (code, description) in currenciesObject {
                                let currency = Currency(code: code,
                                                        description: description,
                                                        symbol: "")
                                currencies.append(currency)
                            }
                            onOK(currencies)
                        }
                    }
        },
                  onError: { (code, description) -> Void in
        })
    }

    // Return a list of real-time rates
    func liveRates(from currency: Currency,
                   to quotes: [Currency],
                   onOK: ([CurrencyRate]) -> Void,
                   onError: (String) -> Void) {

    }
}
