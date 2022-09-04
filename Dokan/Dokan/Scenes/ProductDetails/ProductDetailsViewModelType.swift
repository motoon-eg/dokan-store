//
//  ProductDetailsViewModelType.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import Domain
import Foundation

/// ProductDetails Input & Output
///
typealias ProductDetailsViewModelType = ProductDetailsViewModelInput & ProductDetailsViewModelOutput

/// ProductDetails ViewModel Input
///
protocol ProductDetailsViewModelInput {}

/// ProductDetails ViewModel Output
///
protocol ProductDetailsViewModelOutput {
    func fetchProduct()
    func getproductViewModel() -> TQViewModel
    func getImageview(indexPath: IndexPath) -> sliderViewModel
    func processFetchProduct(product: Product)
    func createProductTitleQuantityView(product: Product) -> TQViewModel
    func createProductImage(product: Product) -> sliderViewModel
}

public enum ProductDetailsState {
    case loading
    case error
    case empty
    case populated
}
