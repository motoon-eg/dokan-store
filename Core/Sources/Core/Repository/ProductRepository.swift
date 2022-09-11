//
//  ProductRepository.swift
//
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Domain
import Foundation
import Networking

/// Implementation of `Domain.ProductRepository`
///
struct ProductRepository: Domain.ProductRepository {
    let remote: ProductsRemoteProtocol

    init(remote: ProductsRemoteProtocol) {
        self.remote = remote
    }

    func loadProducts(at page: Int, completion: @escaping (Result<[Domain.Product], Error>) -> Void) {
        remote.loadProducts(at: page) { result in
            switch result {
            case let .success(list):
                let domainList = list.map { $0.toDomain() }
                completion(.success(domainList))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    func loadSingleProduct(productID: Int, completion: @escaping (Result<Domain.Product, Error>) -> Void) {
        remote.loadSingleProduct(productID: productID) { result in
            switch result {
            case let .success(product):
                let prod = product.toDomain()
                completion(.success(prod))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
