//
//  File.swift
//  
//
//  Created by Omar Ahmed on 23/06/2022.
//

import Foundation

protocol URLProtocol {
    var baseURL: String { get }
}

struct URLs: URLProtocol {
    static let shared = URLs()

    var baseURL = "https://fakestoreapi.com/"
}


extension URLs {
    func getProducts() -> URL? {
        return URL(string: baseURL + "products")
    }
}
