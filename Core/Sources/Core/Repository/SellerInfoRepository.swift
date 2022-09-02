//
//  File.swift
//
//
//  Created by raniazeid on 30/08/2022.
//

import Domain
import Foundation
import Networking

/// Implementation of `Domain.SellerInfoRepository`
///
struct SellerInfoRepository: Domain.SellerInfoRepository {

    let remote: SellerInfoProtocol

    init(remote: SellerInfoProtocol) {
        self.remote = remote
    }

    func loadSellerInfo(completion: @escaping (Result<Domain.SellerInfo, Error>) -> Void) {
        remote.getAllSellerInfo(completion: {
            result in
            switch result {
            case let .success(list):
                let domainList = list.toDomain()
                completion(.success(domainList))
            case let .failure(error):
                completion(.failure(error))
            }
        })
    }
}
