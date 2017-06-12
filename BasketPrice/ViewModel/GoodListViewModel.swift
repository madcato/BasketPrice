//
//  GoodListViewModel.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

protocol GoodListViewModelProtocol {
    var numberOfSections: Int { get }
    var rowsPersection: [Int] { get }
    var basket: Basket { get }

    func qty(for good: GoodListCellDataSource) -> Int
    func dataForCell(section: Int, row: Int) -> GoodListCellDataSource?
    func update(good: GoodListCellDataSource, qty: Int)

    init(data: [Good], basket: Basket)
}

class GoodListViewModel: GoodListViewModelProtocol {
    var data: [Good]
    var basket: Basket

    required init(data: [Good], basket: Basket) {
        self.data = data
        self.basket = basket
    }

    var numberOfSections: Int {
        return 1
    }

    var rowsPersection: [Int] {
        return [data.count]
    }

    func qty(for good: GoodListCellDataSource) -> Int {
        if let element = good as? Good {
            return basket.qty(for: element)
        }
        return 0
    }

    func dataForCell(section: Int, row: Int) -> GoodListCellDataSource? {
        guard data.count > row else { return nil }
        return data[row]
    }

    func update(good: GoodListCellDataSource, qty: Int) {
        if let element = good as? Good {
            basket.update(element, qty: qty)
        }
    }
}
