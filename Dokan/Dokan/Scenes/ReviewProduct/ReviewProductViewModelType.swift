//
//  ReviewProductViewModelType.swift
//  Dokan
//
//  Created by marwa on 16/08/2022.
//

import Domain
import Foundation
/// ReviewProduct Input & Output
///
typealias ReviewProductViewModelType = ReviewProductViewModelInput & ReviewProductViewModelOutput

/// ReviewProduct ViewModel Input
///
protocol ReviewProductViewModelInput {
    var reloadTableViewClosure: () -> Void { get set }
    var showAlertClosure: () -> Void { get set }
    var updateLoadingStatus: () -> Void { get set }
    var showNavBarClosure: () -> Void { get set }
    func getCellViewModel(at indexPath: IndexPath) -> ReviewerCellViewModel
}

/// ReviewProduct ViewModel Output
///
protocol ReviewProductViewModelOutput {
    func loadReviews()
    func configureFetchRatingDetails(completion: @escaping (RatingDetailsViewModel?) -> Void)
    var alertMessage: String { get }
    var navBarRating: Double { get }
    var state: State { get }
    var numberOfCells: Int { get }
}
