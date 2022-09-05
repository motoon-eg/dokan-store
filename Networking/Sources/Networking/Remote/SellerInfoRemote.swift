//
//  File.swift
//
//
//  Created by raniazeid on 30/08/2022.
//

import Domain
import Foundation
/// Protocol for `AllCategoryRemote` mainly used for mocking.

///

public protocol SellerInfoProtocol {

    func getAllSellerInfo(completion: @escaping (Result<SellerInfo, Error>) -> Void)
}

/// Products: Remote Endpoints

///

public class SellerInfoRemote: Remote, SellerInfoProtocol {

    /// Loads all available category

    ///

    public func getAllSellerInfo(completion: @escaping (Result<SellerInfo, Error>) -> Void) {

        let path = "v3/fd437aa0-d818-447b-809f-09ff5413bd97"
        let request = MockApiRequest(method: .get, path: path)

        enqueue(request, completion: completion)
    }
}
