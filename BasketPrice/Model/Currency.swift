//
//  Currency.swift
//  BasketPrice
//
//  Created by Daniel Vela on 12/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class Currency {
    var code: String = "USD"
    var description: String = "US Dollars"

    required init(code: String, description: String) {
        self.code = code
        self.description = description
    }
}
