//
//  File.swift
//  
//
//  Created by Omar Ahmed on 23/06/2022.
//

import Foundation
import Alamofire

enum DokanAPI: API {
    
    case getAllProducts
    case getSingleProduct(productId: Int)
    case makeOrder

    var path: String {
        switch self {
        case .getAllProducts, .makeOrder:
            return "products"
        case .getSingleProduct(productId: let productId):
            return "products/\(productId)"
        }
    }
    var parameters: [String:Any] {
        switch self {
        case .makeOrder:
            let params = [String:Any]()
            return params
        case .getAllProducts, .getSingleProduct(productId: _):
            return [:]
        }
    }
    
    var headers: HTTPHeaders {
        switch self {
          default:
            return [:]
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getAllProducts,.getSingleProduct(productId: _):
            return .get
        case .makeOrder:
            return .post
        }
    }
}
