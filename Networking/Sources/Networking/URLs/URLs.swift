//
//  File.swift
//  
//
//  Created by Omar Ahmed on 23/06/2022.
//

import Foundation

protocol APIProtocol {
    var baseURL: String { get }
}

struct URLs: APIProtocol {
    static let shared = URLs()

    internal var baseURL = "https://fakestoreapi.com/"
}


extension URLs {
    func getProductsURL() -> URL? {
        return URL(string: baseURL + "products")
    }
    
    func getSingleProductURL(productId: Int) -> URL? {
        return URL(string: baseURL + "products/\(productId)")
    }
}
