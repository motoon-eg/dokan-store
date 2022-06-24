//
//  File.swift
//  
//
//  Created by Omar Ahmed on 23/06/2022.
//

import Foundation
import Alamofire

protocol API {    
    var path: String { get }
    
    var parameters: [String:Any] { get }
    
    var headers: HTTPHeaders { get }
    
    var method: HTTPMethod { get }
}
