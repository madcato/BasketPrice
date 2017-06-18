//
//  CurrencyLayerAPI.swift
//  BasketPrice
//
//  Created by Daniel Vela on 14/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation
import SwiftyJSON

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

    override func query(endpoint: String,
                        parameters: [String: String]?,
                        onOK: @escaping (JSON) -> Void,
                        onError: @escaping (Int, String) -> Void) {
        var params: [String: String] = parameters ?? [:]
        params["access_key"] = apiKey

        let url = endpointUrl(endpoint: endpoint)
        let httpData = HttpRequestData(method: .get,
                                       url: url,
                                       parameters: params,
                                       headers: nil)
        request.start(httpData: httpData,
                      onOK: { (object) -> Void in
                        if let json = object,
                            let success = json["success"].bool {
                            if success {
                                onOK(json)
                            } else {
                                if let error = json["error"].dictionary,
                                let code = error["code"]?.int,
                                    let info = error["info"]?.string {
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
