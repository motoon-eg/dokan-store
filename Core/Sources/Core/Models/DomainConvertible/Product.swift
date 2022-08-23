//
//  Product.swift
//
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Domain
import Networking

extension Networking.Product: DomainConvertible {
    // TODO: Description and images should be added.
    func toDomain() -> Domain.Product {
        return Domain.Product(id: String(id),
                              title: title,
                              description: String(),
                              thumbnailUrl: image,
                              imagesListUrls: [])
    }
}
