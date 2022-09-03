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

    private let repository: ReviewsRepository
    private var reviewsList: [Domain.Review] = []

    private var cellViewModels: [ReviewerCellViewModel] = [] {
        didSet {
            onReloadData()
        }
    }

    var state: ReviewProductState = .empty {
        didSet {
            onUpdateLoadingStatus(state)
        }
    }

    var alertMessage: String = "" {
        didSet {
            onShowAlertClosure(alertMessage)
        }
    }

    var navBarRating: Double = .zero {
        didSet {
            onUpdateNavBarWithRating(navBarRating)
        }
    }

    var ratingDetails: RatingDetailsViewModel? {
        didSet {
            fetchRatingDetailsClosure(ratingDetails)
        }
    }

    var numberOfCells: Int {
        if cellViewModels.count == 0, state == .loading {
            return 10
        } else {
            return cellViewModels.count
        }
    }

    var fetchRatingDetailsClosure: (RatingDetailsViewModel?) -> Void = { _ in }
    var onReloadData: (() -> Void) = {}
    var onShowAlertClosure: ((String) -> Void) = { _ in }
    var onUpdateNavBarWithRating: ((Double) -> Void) = { _ in }
    var onUpdateLoadingStatus: ((ReviewProductState) -> Void) = { _ in }

    // MARK: - Init

    init(repository: ReviewsRepository = ServiceLocator.provider.makeReviewsRepository()) {
        self.repository = repository
    }
}

// MARK: - ReviewProductViewModel

extension ReviewProductViewModel: ReviewProductViewModelInput {

    func loadReviews() {
        state = .loading
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.repository.loadReviews { [weak self] result in
                guard let self = self else { return }

                switch result {
                case let .success(reviews):
                    self.processFetchedReviews(reviews: reviews)
                    self.navBarRating = reviews.rating
                    self.state = .loaded
                case let .failure(error):
                    self.state = .error
                    self.alertMessage = error.localizedDescription
                }
            }
        }
    }
}

// MARK: - ReviewProductViewModelOutput

extension ReviewProductViewModel: ReviewProductViewModelOutput {

    func getCellViewModel(at indexPath: IndexPath) -> ReviewerCellViewModel {
        return cellViewModels[indexPath.row]
    }

    func configureFetchRatingDetails(completion: @escaping (RatingDetailsViewModel?) -> Void) {
        fetchRatingDetailsClosure = completion
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

    private func createRatingDetailsViewModel(reviews: Domain.Reviews) -> RatingDetailsViewModel {
        return RatingDetailsViewModel(rating: reviews.rating,
                                      fiveStarNumber: reviews.fiveStarRatingNumber,
                                      fourStarNumber: reviews.fourStarRatingNumber,
                                      threeStarNumber: reviews.threeStarRatingNumber,
                                      twoStarNumber: reviews.twoStarRatingNumber,
                                      oneStarNumber: reviews.oneStarRatingNumber,
                                      totalReviewsNumber: reviews.totalRatingNumber)
    }

    private func processFetchedReviews(reviews: Domain.Reviews) {
        reviewsList = reviews.reviews
        cellViewModels = reviewsList.map { createCellViewModel(reviews: $0) }

        let ratingDetailsView: RatingDetailsViewModel = createRatingDetailsViewModel(reviews: reviews)
        ratingDetails = ratingDetailsView
    }
}

// MARK: - states

enum ReviewProductState {
    case empty
    case loading
    case error
    case loaded
}
