//
//  File.swift
//
//
//  Created by marwa on 23/08/2022.
//

import Foundation

/// Define reviews entity requirements
///
public struct Reviews {
    public let rating: Double
    public let totalRatingNumber, fiveStarRatingNumber, fourStarRatingNumber, threeStarRatingNumber: Int
    public let twoStarRatingNumber, oneStarRatingNumber: Int
    public let reviews: [Review]

    public init(rating: Double, 
                      totalRatingNumber: Int, 
                      fiveStarRatingNumber: Int, 
                      fourStarRatingNumber: Int, 
                      threeStarRatingNumber: Int, 
                      twoStarRatingNumber: Int, 
                      oneStarRatingNumber: Int, 
                      reviews: [Review]) {
        self.rating = rating
        self.fiveStarRatingNumber = fiveStarRatingNumber
        self.fourStarRatingNumber = fourStarRatingNumber
        self.threeStarRatingNumber = threeStarRatingNumber
        self.twoStarRatingNumber = twoStarRatingNumber
        self.oneStarRatingNumber = oneStarRatingNumber
        self.totalRatingNumber = totalRatingNumber
        self.reviews = reviews
    }
}

// MARK: - Review

public struct Review {
    public let image: String
    public let name: String
    public let date: String
    public let rating: Int
    public let reviewDescription: String

    public init(image: String, name: String, date: String, rating: Int, reviewDescription: String) {
        self.image = image
        self.name = name
        self.date = date
        self.rating = rating
        self.reviewDescription = reviewDescription
    }
}
