//
//  File.swift
//
//
//  Created by marwa on 23/08/2022.
//

import Domain
import Foundation
import Networking

/// Implementation of `Domain.ReviewsRepository`
///
struct ReviewsRepository: Domain.ReviewsRepository {

    let remote: ReviewsRemoteProtocol

    init(remote: ReviewsRemoteProtocol) {
        self.remote = remote
    }

    func loadReviews(completion: @escaping (Result<Domain.Reviews, Error>) -> Void) {
        remote.loadReviewProductData { result in
            switch result {
            case let .success(productReviews):
                let convertedReviews = productReviews.toDomain()
                completion(.success(convertedReviews))
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
}
