//
//  RepositoryProvider.swift
//
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Domain
import Foundation
import Networking

/// Provide default implementation for `RepositoryProvider`
///
public struct DefaultRepositoryProvider {
    let network: Network

    public init(network: Network) {
        self.network = network
    }
}

// MARK: - DefaultRepositoryProvider

extension DefaultRepositoryProvider: RepositoryProvider {
    public func makeSellerInfoRepository() -> Domain.SellerInfoRepository {
        let remote = SellerInfoRemote(network: network)
        return SellerInfoRepository(remote: remote)
    }

    public func makeProductRepository() -> Domain.ProductRepository {
        let remote = ProductsRemote(network: network)
        return ProductRepository(remote: remote)
    }
}
