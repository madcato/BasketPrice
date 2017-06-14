//
//  GoodCellAdapter.swift
//  BasketPrice
//
//  Created by Daniel Vela on 12/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

extension Good: GoodListCellDataSource {
    var nameForCell: String {
        return name
    }

    var priceForCell: String {
        let priceInDollars = CurrencyHelper.format(price,
                                                   currencyCode: "USD")
        if let priceInDollars = priceInDollars {
            return "\(priceInDollars) per \(package)"

        }
        return "\(price) per \(package)"
    }
}
