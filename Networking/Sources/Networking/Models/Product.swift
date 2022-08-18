//
//  File.swift
//
//
//  Created by Ahmed M. Hassan on 18/06/2022.
//

import Foundation

public struct Product: Decodable {
    public let id: Int
    public let title: String
    public let price: Double
    public let description, category: String
    public let image: String
    public let rating: Rating?

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case description
        case category, image, rating
    }

    // MARK: - Rating

    public struct Rating: Decodable {
        public let rate: Double
        public let count: Int
    }
}

public typealias ProductsList = [Product]
