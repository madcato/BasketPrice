//
//  CurrencyLayerAPI.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation

class CurrencyLayerAPI: HttpAPI {
#if PRODUCTION
    var serverHostName = "apilayer.net"
    var basePathName = "/api/"
    var apiKey = "63be47e940dd7a88872063a506a71170" // Add this info to an untracked file
#elseif DEBUG
	var serverHostName = "apilayer.net"
	var basePathName = "/api/"
	var apiKey = "63be47e940dd7a88872063a506a71170" // Add this info to an untracked file
#endif

    override func serverHost() -> String {
        return serverHostName
    }

    override func basePath() -> String {
        return basePathName
    }

    override func query(endpoint: String,
                        parameters: [String: String]?,
                        onOK: @escaping ([String: Any]) -> Void,
                        onError: @escaping (Int, String) -> Void) {
        var url = endpointUrl(endpoint: endpoint)
        url += "&access_key=\(apiKey)"
        let httpData = HttpRequestData(method: .get,
                                       url: url,
                                       parameters: parameters,
                                       headers: nil)
        request.start(httpData: httpData,
                      onOK: { (object) -> Void in
                        if let json = object as? [String: Any],
                            let success = json["success"] as? Bool {
                            if success {
                                onOK(json)
                            } else {
                                if let error = json["error"] as? [String: Any],
                                let code = error["code"] as? Int,
                                    let info = error["info"] as? String {
                                    onError(code, info)
                                } else {
                                    onError(0, "Bad response format on error")
                                }
                            }
                            } else {
                                onError(0, "Bad response format")
                            }
                      },
                      onError: onError)
    }
}
