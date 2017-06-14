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
                  onOK: { (json) -> Void in
                    var currencies: [Currency] = []
                    if let currenciesJson = json["currencies"] as? [String: String] {
                        for (code, description) in currenciesJson {
                            let currency = Currency(code: code,
                                             description: description)
                            currencies.append(currency)
                        }
                        onOK(currencies)
                    }
                  },
                  onError: { (_, description) -> Void in
                    onError(description)
        })
    }

    // Return a list of real-time rates
    func liveRates(from currency: Currency,
                   to quotes: [Currency],
                   onOK: ([CurrencyRate]) -> Void,
                   onError: (String) -> Void) {

    }
}
