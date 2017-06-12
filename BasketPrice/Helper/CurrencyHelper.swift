//
//  CurrencyHelper.swift
//  BasketPrice
//
//  Created by Daniel Vela on 12/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class CurrencyHelper {
    static func format(_ amount: Float, currencyCode: String) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencyCode = currencyCode
        if let amountStr = numberFormatter.string(from: NSNumber(value: amount)) {
            return amountStr
        }
        return nil
    }
}
