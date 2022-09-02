//
//  RepositoryProvider.swift
//
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Foundation

/// Should create new instances of Repositories
///
public protocol RepositoryProvider {

    /// Creates new instance of `ProductRepository`
    ///
    func makeProductRepository() -> ProductRepository

    /// Create  new instance Of  'Seller Info Repository'
    func makeSellerInfoRepository() -> SellerInfoRepository
}
