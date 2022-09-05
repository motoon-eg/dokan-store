//
//  InfoSellerViewModelType.swift
//  Dokan
//
//  Created by ziad on 20/08/2022.
//

import Domain
import Foundation

/// InfoSeller Input & Output
///
typealias InfoSellerViewModelType = InfoSellerViewModelInput & InfoSellerViewModelOutput

/// InfoSeller ViewModel Input
///
protocol InfoSellerViewModelInput {
    func loadSellerInfo()
}

/// InfoSeller ViewModel Output
///
protocol InfoSellerViewModelOutput {
    var onReloadData: () -> Void { get set }
    var onShowAlert: (String) -> Void { get set }
    var numberOfCells: Int { get }
    func getInfoSellerProducts(at indexPath: IndexPath) -> SellerInfoCell.ViewModel
    func getInfoSellerData() -> Domain.SellerInfo?
}
