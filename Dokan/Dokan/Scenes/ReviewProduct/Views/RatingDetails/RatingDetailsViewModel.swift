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

    func configureFiveStarProgressBar() -> RatingProgressDetailsViewModel {
        return RatingProgressDetailsViewModel(rating: fiveStarNumber, starNumber: 5, totalRatingNumber: totalReviewsNumber)
    }

    func configureFourStarProgressBar() -> RatingProgressDetailsViewModel {
        return RatingProgressDetailsViewModel(rating: fourStarNumber, starNumber: 4, totalRatingNumber: totalReviewsNumber)
    }

    func configureThreeStarProgressBar() -> RatingProgressDetailsViewModel {
        return RatingProgressDetailsViewModel(rating: threeStarNumber, starNumber: 3, totalRatingNumber: totalReviewsNumber)
    }

    func configureTwoStarProgressBar() -> RatingProgressDetailsViewModel {
        return RatingProgressDetailsViewModel(rating: twoStarNumber, starNumber: 2, totalRatingNumber: totalReviewsNumber)
    }

    func configureOneStarProgressBar() -> RatingProgressDetailsViewModel {
        return RatingProgressDetailsViewModel(rating: oneStarNumber, starNumber: 1, totalRatingNumber: totalReviewsNumber)
    }

    func configureRatingLabel() -> String {
        return String(rating)
    }

    func configureTotalReviewsNumberLabel() -> String {
        return String(totalReviewsNumber) + " Reviews"
    }
}
