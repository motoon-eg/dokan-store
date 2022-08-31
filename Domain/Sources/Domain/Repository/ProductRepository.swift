//
//  ProductRepository.swift
//
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Foundation

/// All product related use cases
///
public protocol ProductRepository {

    /// Load all products at a page. Completes with products list or error if any.
    ///
    func loadProducts(at page: Int, completion: @escaping (Result<[Product], Error>) -> Void)

    func loadSingleProduct(productID: Int, completion: @escaping (Result<Product, Error>) -> Void)
}
