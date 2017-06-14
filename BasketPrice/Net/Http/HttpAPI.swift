//
//  HttpAPI.swift
//  OSFramework
//
//  Created by Daniel Vela on 13/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class HttpAPI {
    var request: HttpRequest

    required init(_ request: HttpRequest) {
        self.request = request
    }

    func httpProtocol() -> String {
        return "http://"
    }

    func serverHost() -> String {
        return "localhost"
    }

    func basePath() -> String {
        return "/"  // "/ApiBasePath/
    }

    func baseUrl() -> String {
        return httpProtocol()
            + serverHost()
            + basePath()
    }

    func endpointUrl(endpoint: String) -> String {
        return baseUrl() + endpoint
    }

    func query(endpoint: String,
               parameters: [String: String]?,
               onOK: @escaping (Any?) -> Void,
               onError: @escaping (Int, String) -> Void) {
        let httpData = HttpRequestData(method: .get,
                                       url: endpointUrl(endpoint: endpoint),
                                       parameters: parameters,
                                       headers: nil)
        request.start(httpData: httpData,
                      onOK: onOK,
                      onError: onError)
    }
}
