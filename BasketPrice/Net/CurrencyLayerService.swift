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
                  onOK: { [unowned self] (json) -> Void in
                    if let currenciesJson = json["currencies"] as? [String: String] {
                        let currencies: [Currency] = self.process(currencies: currenciesJson)
                        onOK(currencies)
                    } else {
                        onError("Bad currencies format")
                    }
                  },
                  onError: { (_, description) -> Void in
                    onError(description)
        })
    }

    // Return a list of real-time rates
    func liveRates(from currency: Currency,
                   to quotes: [Currency],
                   onOK: @escaping ([CurrencyRate]) -> Void,
                   onError: @escaping (String) -> Void) {

        let quotesString = quotes.map { $0.code }.joined(separator: ",")
        let parameters = ["currencies": quotesString,
                          "source": currency.code]

        api.query(endpoint: "live",
                  parameters: parameters,
                  onOK: { [unowned self] (json) in
                    if let quotesJson = json["quotes"] as? [String: Float] {
                        let quotes: [CurrencyRate] = self.process(quotes: quotesJson)
                        onOK(quotes)
                    } else {
                        onError("Bad live rates format")
                    }
            }, onError: { (_, description) in
                onError(description)
        })

    }

    func process(currencies currenciesJson: [String: String]) -> [Currency] {
        var currencies: [Currency] = []
        for (code, description) in currenciesJson {
            let currency = Currency(code: code,
            description: description)
            currencies.append(currency)
        }
        return currencies
    }

    func process(quotes quotesJson: [String: Float]) -> [CurrencyRate] {
        var quotes: [CurrencyRate] = []
        for (quote, rate) in quotesJson {
            let currency = CurrencyRate(quote: quote,
                                        rate: rate)
            quotes.append(currency)
        }
        return quotes
    }
}
