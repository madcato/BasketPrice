//
//  NetworkInjection.swift
//  BasketPrice
//
//  Created by Daniel Vela on 15/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

struct InjectionMap {
    static var networking: CurrencyLayerService = CurrencyLayerServiceFactory().createCLService()
}

extension NetworkingInjected {
    var service: CurrencyLayerService { return InjectionMap.networking }
}
