//
//  File.swift
//  
//
//  Created by marwa on 18/06/2022.
//

import Foundation
import Alamofire

/// Used to map alamofire http methods.
///
/// - Note: so if there any change in alamofire, we need to update it here. 
public enum HTTPMethodd: String { 
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum Task { //wrapper for my reqeust parameter
    case requestPlain
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

public protocol TargetType { //wrapper that carries request properties
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }
    var headers: [String: String]? { get }
}
