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

    // Fetch single Product functions

    func fetchProduct()
    func getproductViewModel() -> TQViewModel?
    func getImageview(indexPath: IndexPath) -> SliderViewModel
    func processFetchProduct(product: Product)

    // Fetch featured products function

    func fetchFeaturedProducts()
    func processFetchProducts(products: [Product])
    func getFeaturedProduct(indexPath: IndexPath) -> FeaturedProduct
}

public enum ProductDetailsState {
    case loading
    case error
    case empty
    case populated
}
