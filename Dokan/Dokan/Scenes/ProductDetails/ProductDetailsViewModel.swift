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
    private var titleQuantityViewModel: TQViewModel? {
        didSet {
            reloadViewClosure?()
        }
    }

    private var imageViewModel: [sliderViewModel] = .init() {
        didSet {
            reloadImageViewClosure?()
        }
    }

    var numberOfCells: Int {
        return imageViewModel.count
    }

    var uploadLoadingState: (() -> Void)?
    var reloadViewClosure: (() -> Void)?
    var reloadImageViewClosure: (() -> Void)?

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

    func getproductViewModel() -> TQViewModel {
        return titleQuantityViewModel!
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

public enum State {
    case loading
    case error
    case empty
    case populated
}
