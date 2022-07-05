//
//  TargetType.swift
//  
//
//  Created by marwa on 28/06/2022.
//

import Foundation
import Alamofire

/// Used to map alamofire http methods.
///
/// - Note: so if there any change in alamofire, we need to update it here.
//public enum HTTPMethodd {
//    case get
//    case post
//    case put
//    case delete
//    var httpMethod: HTTPMethod {
//        switch self{
//        case .get:
//            return .get
//        case .post:
//            return .post
//        case .put:
//            return .put
//        case .delete:
//            return .delete
//        }
//    }
//}

/// wrapper for my reqeust parameter
public enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

/// wrapper that carries request properties
public protocol TargetType {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}
