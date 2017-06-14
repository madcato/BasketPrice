//
//  CurrencyRate.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

struct CurrencyRate {
    var quote: String // "USDEUR" -> "FROMTO"
    var rate: Float

    func convert(from dollars: Float) -> Float {
        return dollars * rate
    }
}
