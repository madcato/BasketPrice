//
//  Good.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

struct Good: Hashable {
    var name: String
    var price: Float
    var package: String

    static func == (lvs: Good, rvs: Good) -> Bool {
        return lvs.name == rvs.name
    }

    public var hashValue: Int {
        return name.hashValue
    }
}
