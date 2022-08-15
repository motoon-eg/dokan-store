//
//  File.swift
//
//
//  Created by marwa on 09/08/2022.
//

import Foundation

// MARK: - ProductsPaginationElement

public struct ProductsPaginationElement: Decodable {
    let id: Int
    let title: String
    let price: Double
    let productsPaginationDescription, category: String
    let image: String
    let rating: Rating
    
    enum CodingKeys: String, CodingKey {
        case id, title, price
        case productsPaginationDescription = "description"
        case category, image, rating
    }
}

// MARK: - Rating

struct Rating: Codable {
    let rate: Double
    let count: Int
}

public typealias ProductsList = [Product]
