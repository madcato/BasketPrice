//
//  GoodListViewModel.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

protocol GoodListInteractorProtocol {
}

protocol GoodListViewModelProtocol {
    var numberOfSections: Int { get }
    var rowsPersection: [Int] { get }

    func dataForCell(section: Int, row: Int) -> GoodListCellDataSource?

    init(data: [Good])
}

class GoodListViewModel: GoodListViewModelProtocol {
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

    var data: [Good]

    required init(data: [Good]) {
		self.data = data
    }
}
