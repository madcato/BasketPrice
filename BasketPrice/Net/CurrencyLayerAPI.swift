//
//  CurrencyLayerAPI.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class CurrencyLayerAPI: HttpAPI {
    var serverHostName = "apilayer.net"
    var basePathName = "/api/"
    var apiKey = "63be47e940dd7a88872063a506a71170" // Add this info to an untracked file

    override func serverHost() -> String {
        return serverHostName
    }

    override func basePath() -> String {
        return basePathName
    }

//    override func query(endpoint: String,
//                        parameters: [String: String],,
//                        onOK: @escaping (Any?) -> Void,
//                        onError: @escaping (Int, String) -> Void) {
//        let httpData = HttpRequestData(method: .get,
//                                       url: endpointUrl(endpoint: endpoint),
//                                       parameters: nil,
//                                       headers: nil)
//        request.start(httpData: httpData,
//                      onOK: onOK,
//                      onError: onError)
//    }
}
