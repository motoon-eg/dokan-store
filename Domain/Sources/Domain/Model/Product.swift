//
//  Product.swift
//  
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Foundation

/// Define product entity requirements
/// 
struct Product {
    public let id: String
    public let title: String
    public let description: String
    public let thumbnailUrl: String
    public let imagesListUrls: [String]
    
    public init(id: String, title: String, description: String, thumbnailUrl: String, imagesListUrls: [String]) {
        self.id = id
        self.title = title
        self.description = description
        self.thumbnailUrl = thumbnailUrl
        self.imagesListUrls = imagesListUrls
    }
}
