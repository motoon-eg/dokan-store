//
//  File.swift
//
//
//  Created by marwa on 23/08/2022.
//

import Foundation

public protocol ReviewsRemoteProtocol {
    func loadReviewProductData(completion: @escaping (Result<Reviews, Error>) -> Void)
}

public class MockNetwork: ReviewsRemoteProtocol {

    public init() {}

    public func loadReviewProductData(completion: @escaping (Result<Reviews, Error>) -> Void) {
        var Reviewsproduct: Reviews
        do {
            let allProductData = try JSONSerialization.data(withJSONObject: mockProductReviewsJsonResponse, options: .fragmentsAllowed)
            Reviewsproduct = try JSONDecoder().decode(Reviews.self, from: allProductData)
            completion(.success(Reviewsproduct))
        } catch {
            completion(.failure(error))
        }
    }
}
