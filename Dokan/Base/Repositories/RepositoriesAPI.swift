//
//  RepositoriesAPI.swift
//  Dokan
//
//  Created by Clara Mounir Adly on 23/06/2022.
//

import Foundation
import Alamofire


protocol RepositoriesAPIProtocol {
    func getRepos(username: String, completionHandler: @escaping (Result<[Repository], NSError>) -> Void)
}

// 3
class RepositoriesAPI: BaseAPI<RepositoriesNetworking>, RepositoriesAPIProtocol {
    
    func getRepos(username: String, completionHandler: @escaping (Result<[Repository], NSError>) -> Void) {
        self.fetchData(target: .getRepos(username: username), responseClass: [Repository].self) { (result) in
            completionHandler(result)
        }
    }
        
       



}
