//
//  ServiceFactory.swift
//  OSFramework
//
//  Created by Daniel Vela on 13/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class ServiceFactory {
    func createService() -> Service {
        let request = HttpRequest()
        let api = HttpAPI(request)
        let service = Service(api)
        return service
    }
}
