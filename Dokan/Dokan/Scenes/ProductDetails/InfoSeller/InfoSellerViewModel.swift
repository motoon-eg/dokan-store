//
//  InfoSellerViewModel.swift
//  Dokan
//
//  Created by ziad on 20/08/2022.
//

import Domain
import Foundation

// MARK: InfoSellerViewModel

//
class InfoSellerViewModel {

    private let repository: SellerInfoRepository
    private var sellerInfoData: Domain.SellerInfo?
    private var cellViewModel: [SellerInfoCell.ViewModel] = []

    var onReloadData: () -> Void = {}
    var showAlert: () -> Void = {}
    var onShowAlert: (String) -> Void = { _ in }
    var numberOfCells: Int {
        return cellViewModel.count
    }

    init(repository: SellerInfoRepository = ServiceLocator.provider.makeSellerInfoRepository()) {
        self.repository = repository
    }
}

// MARK: InfoSellerViewModel

extension InfoSellerViewModel: InfoSellerViewModelInput {

    func loadSellerInfo() {
        repository.loadSellerInfo { [weak self] result in
            guard let self = self else { return }
            switch result {

            case let .failure(error):
                self.onShowAlert(error.localizedDescription)
            case let .success(list):
                self.appendSellerInfoDataToCell(sellerInfo: list)
                self.onReloadData()
            }
        }
    }
}

// MARK: InfoSellerViewModelOutput

//
extension InfoSellerViewModel: InfoSellerViewModelOutput {

    func getInfoSellerData() -> Domain.SellerInfo? {
        return sellerInfoData
    }

    func getInfoSellerProducts(at indexPath: IndexPath) -> SellerInfoCell.ViewModel {
        return cellViewModel[indexPath.row]
    }
}

// MARK: Private Handlers

//
private extension InfoSellerViewModel {

    private func createCellViewModel(sellerInfoProduct: Domain.Products) -> SellerInfoCell.ViewModel {
        return SellerInfoCell.ViewModel(title: sellerInfoProduct.title,
                                        image: sellerInfoProduct.image,
                                        price: sellerInfoProduct.price,
                                        review: sellerInfoProduct.review,
                                        totalReviews: sellerInfoProduct.totalReviews)
    }

    private func appendSellerInfoDataToCell(sellerInfo: Domain.SellerInfo) {
        sellerInfoData = sellerInfo
        let sellerInfoProductList = sellerInfoData?.products ?? []
        cellViewModel = sellerInfoProductList.map { createCellViewModel(sellerInfoProduct: $0) }
    }
}
