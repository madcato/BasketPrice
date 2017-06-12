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
        // FIXME convert to $
        return "\(price) per \(package)"
    }

    var qtyForCell: String {
        // FIXME return the basket qty
        return "0"
    }
}
