//
//  ReviewProductViewModel.swift
//  Dokan
//
//  Created by marwa on 16/08/2022.
//

import Core
import Domain
import Foundation

// MARK: ReviewProductViewModel

class ReviewProductViewModel {
    let repository: ReviewsRepository

    init(repository: ReviewsRepository = ServiceLocator.provider.makeReviewsRepository()) {
        self.repository = repository
    }
}

// MARK: ReviewProductViewModel

extension ReviewProductViewModel: ReviewProductViewModelInput {}

// MARK: ReviewProductViewModelOutput

extension ReviewProductViewModel: ReviewProductViewModelOutput {

    func loadReviews(completion: @escaping (Reviews) -> Void) {
        repository.loadReviews { reviews, _ in
            guard let reviews = reviews else {
                // TODO: - make alert of error
                return
            }
            completion(reviews)
        }
    }
}

// MARK: Private Handlers

private extension ReviewProductViewModel {}
