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
    func loadProducts(at page: Int, completion: @escaping (Result<[Product], Error>) -> Void)
    func loadSingleProduct(productID: Int, completion: @escaping (Result<Product, Error>) -> Void)
}

/// Products: Remote Endpoints
///
public class ProductsRemote: Remote, ProductsRemoteProtocol {

    /// Loads all available products
    ///
    public func loadProducts(at page: Int, completion: @escaping (Result<[Product], Error>) -> Void) {
        let path = "products"
        let parameters = ["offset": page,
                          "limit": Defaults.perPageLimit]
        let request = FakeStoreRequest(method: .get, path: path, parameters: parameters)

        enqueue(request, completion: completion)
    }

    /// Loads all available products
    ///
    public func loadSingleProduct(productID: Int, completion: @escaping (Result<Product, Error>) -> Void) {
        let path = "products/\(productID)"
        let request = FakeStoreRequest(method: .get, path: path)
        enqueue(request, completion: completion)
    }
}

// MARK: Constants

extension ProductsRemote {

    enum Defaults {
        static let perPageLimit = 3
    }
}
