//
//  RatingDetailsViewModel.swift
//  Dokan
//
//  Created by marwa on 30/08/2022.
//

import Domain
import Foundation

struct RatingDetailsViewModel {

    // MARK: Properties

    let rating: Double
    let fiveStarNumber: Int
    let fourStarNumber: Int
    let threeStarNumber: Int
    let twoStarNumber: Int
    let oneStarNumber: Int
    let totalReviewsNumber: Int
}

// MARK: - Configurations

extension RatingDetailsViewModel {

    func configureFiveStarProgressBar() -> RatingProgressDetails.RatingProgressDetailsViewModel {
        return RatingProgressDetails.RatingProgressDetailsViewModel(rating: fiveStarNumber, starNumber: 5, totalRatingNumber: totalReviewsNumber)
    }

    func configureFourStarProgressBar() -> RatingProgressDetails.RatingProgressDetailsViewModel {
        return RatingProgressDetails.RatingProgressDetailsViewModel(rating: fourStarNumber, starNumber: 4, totalRatingNumber: totalReviewsNumber)
    }

    func configureThreeStarProgressBar() -> RatingProgressDetails.RatingProgressDetailsViewModel {
        return RatingProgressDetails.RatingProgressDetailsViewModel(rating: threeStarNumber, starNumber: 3, totalRatingNumber: totalReviewsNumber)
    }

    func configureTwoStarProgressBar() -> RatingProgressDetails.RatingProgressDetailsViewModel {
        return RatingProgressDetails.RatingProgressDetailsViewModel(rating: twoStarNumber, starNumber: 2, totalRatingNumber: totalReviewsNumber)
    }

    func configureOneStarProgressBar() -> RatingProgressDetails.RatingProgressDetailsViewModel {
        return RatingProgressDetails.RatingProgressDetailsViewModel(rating: oneStarNumber, starNumber: 1, totalRatingNumber: totalReviewsNumber)
    }

    func configureRatingLabel() -> String {
        return String(rating)
    }

    func configureTotalReviewsNumberLabel() -> String {
        return String(totalReviewsNumber) + " Reviews"
    }
}
