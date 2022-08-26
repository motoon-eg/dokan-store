//
//  ProductDetailsViewModelType.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import Foundation
import Domain

/// ProductDetails Input & Output
///
typealias ProductDetailsViewModelType = ProductDetailsViewModelInput & ProductDetailsViewModelOutput

/// ProductDetails ViewModel Input
///
protocol ProductDetailsViewModelInput {}

/// ProductDetails ViewModel Output
///
protocol ProductDetailsViewModelOutput {
    func loadProduct(productID: Int, completion: @escaping (Product) -> Void)
}
