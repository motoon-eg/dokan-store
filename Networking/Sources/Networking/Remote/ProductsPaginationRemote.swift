//
//  File.swift
//
//
//  Created by marwa on 09/08/2022.
//

import Foundation

/// Protocol for `ProductsPaginationRemote` mainly used for mocking.
///
public protocol ProductsPaginationRemoteProtocol {
    func loadProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}

/// ProductsPagination: Remote Endpoints
///
public class ProductsPaginationRemote: Remote, ProductsPaginationRemoteProtocol {
    
    /// Loads  products pagination
    ///
    public func loadProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        let path = "products"
        let parameters = ["limit": "5"]
        let request = FakeStoreRequest(method: .get, path: path, parameters: parameters)
        
        enqueue(request, completion: completion)
    }
}
