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

    // MARK: - Properties

    let repository: ReviewsRepository
    private var loadingEnabled: (Bool) -> Void = { _ in }

    var loadingApplied: Bool? {
        didSet {
            loadingEnabled(loadingApplied ?? true)
        }
    }

    // MARK: - Init

    init(repository: ReviewsRepository = ServiceLocator.provider.makeReviewsRepository()) {
        self.repository = repository
    }
}

// MARK: ReviewProductViewModel

extension ReviewProductViewModel: ReviewProductViewModelInput {}

// MARK: ReviewProductViewModelOutput

extension ReviewProductViewModel: ReviewProductViewModelOutput {

    func loadReviews(completion: @escaping (Reviews) -> Void) {
        loadingApplied = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.repository.loadReviews { reviews, _ in
                guard let reviews = reviews else {
                    //
                    return
                }
                self.loadingApplied = false
                completion(reviews)
            }
        }
    }

    func configureLoadingEnabled(onEnabled: @escaping (Bool) -> Void) {
        loadingEnabled = onEnabled
    }
}

// MARK: Private Handlers

private extension ReviewProductViewModel {}
