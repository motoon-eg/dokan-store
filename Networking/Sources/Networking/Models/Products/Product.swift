//
//  File.swift
//  
//
//  Created by Omar Ahmed on 23/06/2022.
//

import Foundation

public struct Product: Codable {
    let id: Int?
    let title: String?
    let price: Double?
    let welcomeDescription: String?
    let category: String?
    let image: String?
    let rating: Rating?
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case welcomeDescription = "welcomeDescription"
        case category = "category"
        case image = "image"
        case rating = "rating"
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        title = try values.decodeIfPresent(String.self, forKey: .title)
        price = try values.decodeIfPresent(Double.self, forKey: .price)
        welcomeDescription = try values.decodeIfPresent(String.self, forKey: .welcomeDescription)
        category = try values.decodeIfPresent(String.self, forKey: .category)
        image = try values.decodeIfPresent(String.self, forKey: .image)
        rating = try values.decodeIfPresent(Rating.self, forKey: .rating)
    }
}


struct Rating: Codable {
    let rate: Double?
    let count: Int?
    
    enum CodingKeys: String, CodingKey {
        case rate = "rate"
        case count = "count"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        rate = try values.decodeIfPresent(Double.self, forKey: .rate)
        count = try values.decodeIfPresent(Int.self, forKey: .count)
    }
    
}
