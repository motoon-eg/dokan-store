//
//  File.swift
//  
//
//  Created by marwa on 18/06/2022.
//

import Foundation
import Alamofire

public enum HTTPMethodd: String {  //to map alamofire http methods so if there any change in alamofire I will change here only
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

public enum Task { //wrapper for my reqeust parameter
    case requestPlain
    case requestParameters(parameters:[String:Any],encoding: ParameterEncoding )
}

public protocol TargetType { //wrapper that carries request properties
    var baseURL : String {get}
    var path: String {get}
    var method: HTTPMethodd { get }
    var task:Task {get}
    var headers: [String:String]? {get}
}
