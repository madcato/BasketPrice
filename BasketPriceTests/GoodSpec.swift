//
//  GoodSpec.swift
//  BasketPrice
//
//  Created by Daniel Vela on 19/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import XCTest
import Quick
import Nimble
@testable import BasketPrice

class GoodSpec: QuickSpec {
    override func spec() {
        describe("th good model") {
            it("is comparable") {
                let good1 = Good(name: "Pea", price: 0.1, package: "bag")
                let good2 = Good(name: "Pea", price: 0.4, package: "bags")
                let good3 = Good(name: "Bean", price: 1.1, package: "bottle")
                expect(good1).to(equal(good2))
                expect(good1).toNot(equal(good3))
            }
        }
    }
}
