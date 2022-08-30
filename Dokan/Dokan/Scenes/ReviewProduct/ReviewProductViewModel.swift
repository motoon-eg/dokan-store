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

    private var reviewsList: [Domain.Review] = .init()

    private var cellViewModels: [ReviewerCellViewModel] = .init() {
        didSet {
            reloadTableViewClosure()
        }
    }

    var state: State = .empty {
        didSet {
            updateLoadingStatus()
        }
    }

    var alertMessage: String = .init() {
        didSet {
            showAlertClosure()
        }
    }

    var navBarRating: Double = .init() {
        didSet {
            showNavBarClosure()
        }
    }

    var numberOfCells: Int {
        return cellViewModels.count
    }

    var reloadTableViewClosure: (() -> Void) = {}
    var showAlertClosure: (() -> Void) = {}
    var showNavBarClosure: (() -> Void) = {}
    var updateLoadingStatus: (() -> Void) = {}

    // MARK: - Init

    init(repository: ReviewsRepository = ServiceLocator.provider.makeReviewsRepository()) {
        self.repository = repository
    }
}

// MARK: - ReviewProductViewModel

extension ReviewProductViewModel: ReviewProductViewModelInput {}

// MARK: - ReviewProductViewModelOutput

extension ReviewProductViewModel: ReviewProductViewModelOutput {

    func loadReviews() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.repository.loadReviews { [weak self] reviews, error in
                guard let self = self else { return }
                guard let reviews = reviews else {
                    self.state = .error
                    self.alertMessage = error?.localizedDescription ?? " "
                    return
                }
                self.processFetchedReviews(reviews: reviews)
                self.navBarRating = reviews.rating
                self.state = .loaded
            }
        }
    }

    func getCellViewModel(at indexPath: IndexPath) -> ReviewerCellViewModel {
        return cellViewModels[indexPath.row]
    }
}

// MARK: - Private Handlers

private extension ReviewProductViewModel {

    private func createCellViewModel(reviews: Domain.Review) -> ReviewerCellViewModel {
        return ReviewerCellViewModel(reviewerImageUrl: reviews.image,
                                     reviewerName: reviews.name,
                                     reviewerComment: reviews.reviewDescription,
                                     rating: Double(reviews.rating))
    }

    private func processFetchedReviews(reviews: Domain.Reviews) {
        reviewsList = reviews.reviews
        var cellVMs = [ReviewerCellViewModel]()
        for review in reviewsList {
            cellVMs.append(createCellViewModel(reviews: review))
        }
        cellViewModels = cellVMs
    }
}

// MARK: - states

enum State {
    case empty
    case loading
    case error
    case loaded
}
