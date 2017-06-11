//
//  BasketElement.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

struct BasketElement: Equatable, Hashable {
    var article: Good
    var qty: Int

    public static func == (lhs: BasketElement, rhs: BasketElement) -> Bool {
        return lhs.article == rhs.article
    }

    public var hashValue: Int {
        return article.hashValue
    }
}
