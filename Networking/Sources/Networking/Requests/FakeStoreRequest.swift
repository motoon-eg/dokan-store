//
//  File.swift
//  
//
//  Created by Ahmed M. Hassan on 18/06/2022.
//

import Foundation
import Alamofire


/// Represents Fakestore.com Endpoint
///
struct FakeStoreRequest: URLRequestConvertible {
    
    /// HTTP Request Method
    ///
    let method: HTTPMethod

    /// URL Path
    ///
    let path: String

    /// Parameters
    ///
    let parameters: [String: Any]
    
    /// Designated Initializer.
    ///
    /// - Parameters:
    ///     - method: HTTP Method we should use.
    ///     - path: RPC that should be called.
    ///     - parameters: Collection of Key/Value parameters, to be forwarded to the Jetpack Connected site.
    ///
    init(method: HTTPMethod, path: String, parameters: [String: Any]? = nil) {
        self.method = method
        self.path = path
        self.parameters = parameters ?? [:]
    }
    
    /// Returns a URLRequest instance reprensenting the current FakeStore Request.
    ///
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Settings.storeApiBaseURL + path)!
        let request = try URLRequest(url: url, method: method, headers: nil)

        return try encoder.encode(request, with: parameters)
    }
}

// MARK: - FakeStore Request: Internal
//
private extension FakeStoreRequest {
    
    /// Returns the Parameters Encoder
    ///
    var encoder: ParameterEncoding {
        return method == .get ? URLEncoding.queryString : URLEncoding.httpBody
    }
}
