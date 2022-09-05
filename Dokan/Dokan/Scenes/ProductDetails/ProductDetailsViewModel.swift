//
//  ProductDetailsViewModel.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import Domain
import Foundation

// MARK: ProductDetailsViewModel

class ProductDetailsViewModel {

    /// Init repository

    let repository: ProductRepository

    init(repository: ProductRepository = ServiceLocator.provider.makeProductRepository()) {
        self.repository = repository
    }

    /// Dummy Product for error handling

    static let dummyData: TQViewModel = .init(title: "", currency: "", price: "", reviewAverage: 0.0, reviewCount: 0, stockCount: 0)

    /// Single product properties

    private var titleQuantityViewModel: TQViewModel? {
        didSet {
            reloadViewClosure?()
        }
    }

    var productDetailsState: ProductDetailsState = .empty {
        didSet {
            onStateUpdate?()
        }
    }

    private var imageViewModel: [SliderViewModel] = [] {
        didSet {
            reloadImageViewClosure?()
        }
    }

    private var product: Product?
    var onStateUpdate: (() -> Void)?
    var reloadViewClosure: (() -> Void)?
    var reloadImageViewClosure: (() -> Void)?

    /// Fetch  products properties

    private var featuredProducts: [FeaturedProduct] = [] {
        didSet {
            reloadCollectionViewClosure?()
        }
    }

    var featuredProductsState: ProductDetailsState = .empty {
        didSet {
            onFeaturedProductsStateUpdate?()
        }
    }

    private var products: [Product] = []
    var reloadCollectionViewClosure: (() -> Void)?
    var onFeaturedProductsStateUpdate: (() -> Void)?
}

// MARK: ProductDetailsViewModel

extension ProductDetailsViewModel: ProductDetailsViewModelInput {}

// MARK: ProductDetailsViewModelOutput

extension ProductDetailsViewModel: ProductDetailsViewModelOutput {

    /// Fetch single Product functions

    func fetchProduct() {
        productDetailsState = .loading

        repository.loadSingleProduct(productID: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {

            case let .success(product):
                self.processFetchProduct(product: product)
                self.productDetailsState = .populated
            case let .failure(error):
                self.productDetailsState = .error
                LogError(error.localizedDescription)
            }
        }
    }

    func getproductViewModel() -> TQViewModel? {
        return titleQuantityViewModel
    }

    func getImageview(indexPath: IndexPath) -> SliderViewModel {
        return imageViewModel[indexPath.row]
    }

    private func createProductTitleQuantityView(product: Product) -> TQViewModel {

        return TQViewModel(title: product.title, currency: "$", price: product.price, reviewAverage: 4.8, reviewCount: 23, stockCount: 8)
    }

    private func createProductImage(product: Product) -> SliderViewModel {

        return SliderViewModel(productImage: product.thumbnailUrl)
    }

    func processFetchProduct(product: Product) {
        self.product = product
        var imgs = [SliderViewModel]()
        titleQuantityViewModel = createProductTitleQuantityView(product: product)
        imgs.append(createProductImage(product: product))
        imageViewModel = imgs
    }

    /// Fetch featured products function

    func fetchFeaturedProducts() {
        repository.loadProducts(at: 1) { result in
            switch result {

            case let .success(products):
                self.processFetchProducts(products: products)
                self.featuredProductsState = .populated
            case let .failure(error):
                LogError(error.localizedDescription)
                self.featuredProductsState = .error
            }
        }
    }

    private func createFeaturedProductModel(product: Product) -> FeaturedProduct {
        return FeaturedProduct(image: product.thumbnailUrl, title: product.title, price: product.price)
    }

    func processFetchProducts(products: [Product]) {
        self.products = products
        var featuredProductsArray = [FeaturedProduct]()

        for product in products {
            featuredProductsArray.append(createFeaturedProductModel(product: product))
        }

        featuredProducts = featuredProductsArray
    }

    func getFeaturedProduct(indexPath: IndexPath) -> FeaturedProduct {
        return featuredProducts[indexPath.row]
    }
}

// MARK: Private Handlers

private extension ProductDetailsViewModel {}

// MARK: Public Extensions

extension ProductDetailsViewModel {
    var numberOfCells: Int {
        return imageViewModel.count
    }

    var numberOfFeaturedProductsCells: Int {
        return featuredProducts.count
    }
}
