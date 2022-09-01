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
            reloadTableViewClosure()
        }
    }

    var state: State = .empty {
        didSet {
            updateLoadingStatus()
        }
    }

    var alertMessage: String = "" {
        didSet {
            showAlertClosure()
        }
    }

    var navBarRating: Double = .zero {
        didSet {
            showNavBarClosure()
        }
    }

    var ratingDetails: RatingDetailsViewModel? {
        didSet {
            fetchRatingDetailsClosure(ratingDetails)
        }
    }

    var numberOfCells: Int {
        return cellViewModels.count
    }

    var fetchRatingDetailsClosure: (RatingDetailsViewModel?) -> Void = { _ in }
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

extension ReviewProductViewModel: ReviewProductViewModelInput {

    func getCellViewModel(at indexPath: IndexPath) -> ReviewerCellViewModel {
        return cellViewModels[indexPath.row]
    }
}

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
