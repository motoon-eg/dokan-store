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
    public let welcomeDescription: String
    public let category: String
    public let image: String
    public let rating: Rating

    enum CodingKeys: String, CodingKey {
        case id, title, price
        case welcomeDescription = "description"
        case category, image, rating
    }

    // MARK: - Rating

    public struct Rating: Codable {
        public let rate: Double
        public let count: Int
    }
}
