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
    private var titleQuantityViewModel: tQViewModel? {
        didSet {
            reloadViewClosure?()
        }
    }

    var uploadLoadingState: (() -> Void)?
    var reloadViewClosure: (() -> Void)?

    var state: State = .empty {
        didSet {
            uploadLoadingState?()
        }
    }

    let repository: ProductRepository

    init(repository: ProductRepository = ServiceLocator.provider.makeProductRepository()) {
        self.repository = repository
    }
}

// MARK: ProductDetailsViewModel

extension ProductDetailsViewModel: ProductDetailsViewModelInput {}

// MARK: ProductDetailsViewModelOutput

extension ProductDetailsViewModel: ProductDetailsViewModelOutput {

    func initFetchSingleProduct() {
        state = .loading

        repository.loadSingleProduct(productID: 1) { [weak self] result in
            guard let self = self else { return }
            switch result {

            case let .success(product):
                self.processFetchProduct(product: product)
                self.state = .populated
            case let .failure(error):
                self.state = .error
                print("Error on loading product :- \(error.localizedDescription)")
            }
        }
    }

    func getproductViewModel() -> tQViewModel {
        return titleQuantityViewModel!
    }

    func createProductTitleQuantityView(product: Product) -> tQViewModel {

        return tQViewModel(title: product.title, currency: "$", price: product.price, reviewAverage: 4.8, reviewCount: 23, stockCount: 8)
    }

    func processFetchProduct(product: Product) {
        self.product = product
        titleQuantityViewModel = createProductTitleQuantityView(product: product)
    }
}

// MARK: Private Handlers

private extension ProductDetailsViewModel {}

public enum State {
    case loading
    case error
    case empty
    case populated
}
