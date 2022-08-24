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

    func loadReviews(completion: @escaping (Domain.Reviews?, Error?) -> Void) {
        remote.loadReviewProductData { productReviews, error in
            guard let productReviews = productReviews else {
                completion(nil, error!)
                return
            }
            let convertedReviews = productReviews.toDomain()
            completion(convertedReviews, nil)
        }
    }
}
