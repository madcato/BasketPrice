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

    func dataForCell(section: Int, row: Int) -> GoodListCellDataSource?

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

    func dataForCell(section: Int, row: Int) -> GoodListCellDataSource? {
        guard data.count > row else { return nil }
        return data[row]
    }
}
