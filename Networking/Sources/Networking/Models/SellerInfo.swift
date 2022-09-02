//
//  File.swift
//
//
//  Created by raniazeid on 30/08/2022.
//

import Foundation

// MARK: - Seller

public struct SellerInfo: Decodable {
    public let sellerName: String
    public let reviews: Double
    public let location, workTime: String
    public let followers, productsCount: Int
    public let createdAt: String
    public let products: [Products]
}

// MARK: - Seller Product

public struct Products: Decodable {
    public let title: String
    public let image: String
    public let price: Int
    public let review: Double
    public let totalReviews: Int
}
