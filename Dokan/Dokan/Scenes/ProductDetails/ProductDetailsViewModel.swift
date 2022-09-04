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

    private var product: Product?
    var onStateUpdate: (() -> Void)?
    var reloadViewClosure: (() -> Void)?
    var reloadImageViewClosure: (() -> Void)?

    let repository: ProductRepository

    init(repository: ProductRepository = ServiceLocator.provider.makeProductRepository()) {
        self.repository = repository
    }
}

// MARK: ProductDetailsViewModel

extension ProductDetailsViewModel: ProductDetailsViewModelInput {}

// MARK: ProductDetailsViewModelOutput

extension ProductDetailsViewModel: ProductDetailsViewModelOutput {

    func fetchProduct() {
        state = .loading

        repository.loadSingleProduct(productID: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {

            case let .success(product):
                self.processFetchProduct(product: product)
                self.state = .populated
            case let .failure(error):
                self.state = .error
                LogError(error.localizedDescription)
            }
        }
    }

    func getproductViewModel() -> TQViewModel? {
        return titleQuantityViewModel
    }

    func getImageview(indexPath: IndexPath) -> sliderViewModel {
        return imageViewModel[indexPath.row]
    }

    private func createProductTitleQuantityView(product: Product) -> TQViewModel {

        return TQViewModel(title: product.title, currency: "$", price: product.price, reviewAverage: 4.8, reviewCount: 23, stockCount: 8)
    }

    private func createProductImage(product: Product) -> sliderViewModel {

        return sliderViewModel(productImage: product.thumbnailUrl)
    }

    func processFetchProduct(product: Product) {
        self.product = product
        var imgs = [sliderViewModel]()
        titleQuantityViewModel = createProductTitleQuantityView(product: product)
        imgs.append(createProductImage(product: product))
        imageViewModel = imgs
    }
}

// MARK: Private Handlers

private extension ProductDetailsViewModel {}


// MARK: Public Extensions

extension ProductDetailsViewModel {
    var numberOfCells: Int {
        return imageViewModel.count
    }
    
    private var titleQuantityViewModel: TQViewModel? {
        didSet {
            reloadViewClosure?()
        }
    }
    
    var state: ProductDetailsState = .empty {
        didSet {
            onStateUpdate?()
        }
    }
    
    private var imageViewModel: [sliderViewModel] = [] {
        didSet {
            reloadImageViewClosure?()
        }
    }
    
}
