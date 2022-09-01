//
//  File.swift
//
//
//  Created by marwa on 23/08/2022.
//

import Domain
import Networking

extension Networking.Reviews: DomainConvertible {

    func toDomain() -> Domain.Reviews {
        return Domain.Reviews(rating: rating, 
                                                 totalRatingNumber: totalRatingNumber, 
                                                 fiveStarRatingNumber: fiveStarRatingNumber, 
                                                 fourStarRatingNumber: fourStarRatingNumber, 
                                                 threeStarRatingNumber: threeStarRatingNumber, 
                                                 twoStarRatingNumber: twoStarRatingNumber, 
                                                 oneStarRatingNumber: oneStarRatingNumber, 
                                                 reviews: reviews.map { $0.toDomain() })
    }
}

extension Networking.Review: DomainConvertible {

    func toDomain() -> Domain.Review {
        return Domain.Review(image: image, name: name, date: date, rating: rating, reviewDescription: reviewDescription)
    }
}
