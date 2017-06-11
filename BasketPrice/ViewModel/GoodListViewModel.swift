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
	var list: [Good] { get }
	var listDidChange: ((GoodListViewModelProtocol) -> Void)? { get set }

    init(interactor: GoodListInteractorProtocol)
}

class GoodListViewModel: GoodListViewModelProtocol {
    var numberOfSections: Int {
            return 1
    }

    var rowsPersection: [Int] {
            return [list.count]
    }

    var list: [Good] {
        didSet {
            self.listDidChange?(self)
        }
    }
    var listDidChange: ((GoodListViewModelProtocol) -> Void)?

    var interactor: GoodListInteractorProtocol

    required init(interactor: GoodListInteractorProtocol) {
		self.list = []
		self.interactor = interactor
    }
}
