//
//  ProductUseCase.swift
//
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Foundation

/// All product related use cases
///
public protocol ProductUseCase {

    /// Load all products at a page
    ///
    func loadProducts(at page: Int) async throws -> [Product]
}
