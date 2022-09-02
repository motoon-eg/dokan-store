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
    public let products: [Products]

    public init(sellerName: String, reviews: Double,
                location: String, workTime: String,
                followers: Int, productsCount: Int,
                createdAt: String, products: [Products]) {
        self.sellerName = sellerName
        self.reviews = reviews
        self.location = location
        self.workTime = workTime
        self.followers = followers
        self.productsCount = productsCount
        self.createdAt = createdAt
        self.products = products
    }
}

// MARK: - Seller Product

public struct Products {
    public let title: String
    public let image: String
    public let price: Int
    public let review: Double
    public let totalReviews: Int

    public init(title: String, image: String, price: Int, review: Double, totalRevieews: Int) {
        self.title = title
        self.image = image
        self.price = price
        self.review = review
        totalReviews = totalRevieews
    }
}
