//
//  RepositoriesNetworking.swift
//  Dokan
//
//  Created by Clara Mounir Adly on 23/06/2022.
//

import Foundation
import Alamofire

enum RepositoriesNetworking {
    case getRepos(username: String)
}

extension RepositoriesNetworking: TargetType {
    var baseURL: String {
        switch self {
        default:
            return ""
        }
    }
    var path: String {
        switch self {
        case .getRepos(let username):
            return "/users/\(username)/repos"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .getRepos:
            return .get
        }
    }
    var task: Task {
        switch self {
        case .getRepos:
            return .requestPlain
        }
    }
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
  } 
    }
}


