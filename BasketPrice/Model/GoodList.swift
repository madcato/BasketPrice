//
//  GoodList.swift
//  BasketPrice
//
//  Created by Daniel Vela on 11/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class GoodList {
    static func load() -> [Good]? {
        guard let list = PropertyListHelper.loadArray(fromFile: "GoodList") as? [[String: Any]]
        else {
            return nil
        }

        var resultArray: [Good] = []
        for element in list {
            let name = element["name"] as? String ?? ""
            let price = element["price"] as? Float ?? 0.0
            let package = element["package"] as? String ?? ""
            let good = Good(name: name,
                            price: price,
                            package: package)
            resultArray.append(good)
        }
        return resultArray
    }
}
