//
//  File.swift
//
//
//  Created by marwa on 23/08/2022.
//

import Foundation

// MARK: - Reviews

public struct Reviews: Codable {
    public let rating: Double
    public let totalRatingNumber, fiveStarRatingNumber, fourStarRatingNumber, threeStarRatingNumber: Int
    public let twoStarRatingNumber, oneStarRatingNumber: Int
    public let reviews: [Review]
}

// MARK: - Review

public struct Review: Codable {
    public let image: String
    public let name: String
    public let date: String
    public let rating: Int
    public let reviewDescription: String
}
