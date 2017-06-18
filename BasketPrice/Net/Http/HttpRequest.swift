//
//  HttpRequest.swift
//  OSFramework
//
//  Created by Daniel Vela on 13/06/2017.
//  Copyright © 2017 Daniel Vela. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

enum HTTPRequestMethod {
    case get
    case post
}

class HttpRequest {

    func convertMethod(method: HTTPRequestMethod) -> HTTPMethod {
        switch method {
        case .get:
            return HTTPMethod.get
        case .post:
            return HTTPMethod.post
        }
    }

    func start(httpData: HttpRequestData,
               onOK: @escaping (JSON?) -> Void,
               onError: @escaping (Int, String) -> Void) {
        activity(visible: true)
        print("HTTP Query: \(httpData.method == .post ? "POST":"GET") \(httpData.url)")
        Alamofire.request(httpData.url,
                          method: convertMethod(method: httpData.method),
                          parameters: httpData.parameters,
                          encoding: URLEncoding.default,
                          headers: httpData.headers)
            .validate()
            .responseJSON { [unowned self] response in
                self.activity(visible: false)
                self.process(response, onOK, onError)
        }
    }

    func process(_ response: DataResponse<Any>,
                 _ onOK: @escaping (JSON?) -> Void,
                 _ onError: @escaping (Int, String) -> Void) {
        guard case let .failure(error) = response.result else {
            if let value = response.result.value {
                let json = JSON(value)
                onOK(json)
            } else {
                print("Unknown error: there is no response or error")
            }
            return
        }
        if let error = error as? AFError {
            process(error)
            print("Underlying error: \(String(describing: error.underlyingError))")
        } else if let error = error as? URLError {
            print("URLError occurred: \(error)")
        } else {
            print("Unknown error: \(error)")
        }
        onError(response.response?.statusCode ?? 0, error.localizedDescription)
    }

    func process(_ error: AFError) {
        switch error {
        case .invalidURL(let url):
            print("Invalid URL: \(url) - \(error.localizedDescription)")
        case .parameterEncodingFailed(let reason):
            print("Parameter encoding failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
        case .multipartEncodingFailed(let reason):
            print("Multipart encoding failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
        case .responseValidationFailed(let reason):
            print("Response validation failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
            switch reason {
            case .dataFileNil, .dataFileReadFailed:
                print("Downloaded file could not be read")
            case .missingContentType(let acceptableContentTypes):
                print("Content Type Missing: \(acceptableContentTypes)")
            case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
                print("Response content type: \(responseContentType)" +
                    " was unacceptable: \(acceptableContentTypes)")
            case .unacceptableStatusCode(let code):
                print("Response status code was unacceptable: \(code)")
            }
        case .responseSerializationFailed(let reason):
            print("Response serialization failed: \(error.localizedDescription)")
            print("Failure Reason: \(reason)")
        }
    }

    func cancel() {
        // not implemented
    }

    func activity(visible: Bool) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = visible
    }
}
