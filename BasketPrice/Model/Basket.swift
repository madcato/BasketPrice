//
//  Basket.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class Basket {
    var includedElements = Set<BasketElement>()

    func add(_ element: Good, qty: Int) {
        let found = findElement(element)
        if found.count > 0 {
            var basketElement = found[0]
            basketElement.qty += qty
            includedElements.update(with: basketElement)
        } else {
            let basketElement = BasketElement(article: element, qty: qty)
            includedElements.insert(basketElement)
        }
    }

    func substract(_ element: Good, qty: Int) {
        let found = findElement(element)
        assert(found.count > 0, "only already added elements can be subsstracted")
        if found.count > 0 {
            var basketElement = found[0]
            basketElement.qty -= qty

            if basketElement.qty <= 0 {
                includedElements.remove(basketElement)
            } else {
                includedElements.update(with: basketElement)
            }
        }
    }

    func findElement(_ element: Good) -> [BasketElement] {
        return includedElements.filter { (basketElement) -> Bool in
            if basketElement.article == element {
                return true
            }
            return false
        }

    }

}
