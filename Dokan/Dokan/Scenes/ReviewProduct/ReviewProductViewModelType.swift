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
    func loadReviews()
    var onReloadData: () -> Void { get set }
}

/// ReviewProduct ViewModel Output
///
protocol ReviewProductViewModelOutput {
    var onShowAlertClosure: (String) -> Void { get set }
    var onUpdateLoadingStatus: (ReviewProductState) -> Void { get set }
    var onUpdateNavBarWithRating: (Double) -> Void { get set }
    func getCellViewModel(at indexPath: IndexPath) -> ReviewerTableViewCell.ReviewerCellViewModel
    func configureFetchRatingDetails(completion: @escaping (RatingDetailsViewModel?) -> Void)
    var numberOfCells: Int { get }
    var state: ReviewProductState { get set }
}
