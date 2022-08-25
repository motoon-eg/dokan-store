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
protocol ReviewProductViewModelInput {}

/// ReviewProduct ViewModel Output
///
protocol ReviewProductViewModelOutput {
    func loadReviews(completion: @escaping (Domain.Reviews) -> Void)
    func configureLoadingEnabled(onEnabled: @escaping (Bool) -> Void)
    func configureShowError(onshow: @escaping (String) -> Void)
}
