//
//  HttpRequestData.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

struct HttpRequestData {
    var method: HTTPRequestMethod
    var url: String
    var parameters: [String:Any]?
    var headers: [String: String]?
}
