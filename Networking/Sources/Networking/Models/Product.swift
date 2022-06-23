//
//  File.swift
//  
//
//  Created by Omar Ahmed on 23/06/2022.
//

import Foundation

struct Product: Codable {
    let id: Int
    let title: String
    let price: Double
    let welcomeDescription: String
    let category: String
    let image: String
    let rating: Rating
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case welcomeDescription = "welcomeDescription"
        case category = "category"
        case image = "image"
        case rating = "rating"
    }
}

struct Rating: Codable {
    let rate: Double
    let count: Int
}
