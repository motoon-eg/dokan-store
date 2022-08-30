//
//  File.swift
//
//
//  Created by raniazeid on 30/08/2022.
//

import Foundation

public struct SellerInfo {
    public let sellerName: String
    public let reviews: Double
    public let location, workTime: String
    public let followers, productsCount: Int
    public let createdAt: String
    public let sellerProducts: [SellerProduct]

    public init(sellerName: String, reviews: Double, location: String, workTime: String, followers: Int, productsCount: Int, createdAt: String, sellerProducts: [SellerProduct]) {
        self.sellerName = sellerName
        self.reviews = reviews
        self.location = location
        self.workTime = workTime
        self.followers = followers
        self.productsCount = productsCount
        self.createdAt = createdAt
        self.sellerProducts = sellerProducts
    }
}

// MARK: - Seller Product

public struct SellerProduct {
    public let title: String
    public let image: String
    public let price: Int
    public let review: Double
    public let totalReviews: Int
}
