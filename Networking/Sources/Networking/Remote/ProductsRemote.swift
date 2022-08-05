//
//  File.swift
//  
//
//  Created by Ahmed M. Hassan on 18/06/2022.
//

import Foundation

/// Protocol for `ProductsRemote` mainly used for mocking.
///
public protocol ProductsRemoteProtocol {
    func loadAllProducts(completion: @escaping (Result<[Product], Error>) -> Void)
}

/// Products: Remote Endpoints
///
public class ProductsRemote: Remote, ProductsRemoteProtocol {
    
    /// Loads all available products
    ///
    public func loadAllProducts(completion: @escaping (Result<[Product], Error>) -> Void) {
        let path = "products"
        let request = FakeStoreRequest(method: .get, path: path)

        enqueue(request, completion: completion)
    }
}
