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
    private var showError: (String) -> Void = { _ in }

    var loadingApplied: Bool? {
        didSet {
            loadingEnabled(loadingApplied ?? true)
        }
    }

    var errorMessage: String? {
        didSet {
            showError(errorMessage ?? " ")
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
            self.repository.loadReviews { [weak self] reviews, error in
                guard let self = self else { return }
                guard let reviews = reviews else {
                    self.showErrorAlert(error: error)
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

    func configureShowError(onshow: @escaping (String) -> Void) {
        showError = onshow
    }
}

// MARK: Private Handlers

private extension ReviewProductViewModel {

    func showErrorAlert(error: Error?) {
        guard let error = error else { return }
        errorMessage = error.localizedDescription
    }
}
