//
//  Service.swift
//  OSFramework
//
//  Created by Daniel Vela on 13/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class Service {
    var api: HttpAPI

    required init(_ api: HttpAPI) {
        self.api = api
    }
}
