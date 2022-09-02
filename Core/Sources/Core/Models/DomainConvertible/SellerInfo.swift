//
//  File.swift
//
//
//  Created by raniazeid on 30/08/2022.
//

import Domain
import Networking

extension Networking.SellerInfo: DomainConvertible {

    func toDomain() -> Domain.SellerInfo {
        return Domain.SellerInfo(sellerName: sellerName,
                                 reviews: reviews,
                                 location: location,
                                 workTime: workTime,
                                 followers: followers,
                                 productsCount: productsCount,
                                 createdAt: createdAt,
                                 products: products.map { $0.toDomain() })
    }
}

extension Networking.Products: DomainConvertible {
    func toDomain() -> Domain.Products {
        return Domain.Products(title: title, image: image, price: price, review: review, totalRevieews: totalReviews)
    }
}
