//
//  CurrencyLayerServiceFactory.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class CurrencyLayerServiceFactory: ServiceFactory {
    func createCLService() -> CurrencyLayerService {
        let request = HttpRequest()
        let api = CurrencyLayerAPI(request)
        let service = CurrencyLayerService(api)
        return service
    }
}
