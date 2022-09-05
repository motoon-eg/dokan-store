//
//  File.swift
//
//
//  Created by marwa on 23/08/2022.
//

import Foundation

/// Reviews related use cases
///
public protocol ReviewsRepository {

    /// Load Reviews
    ///
    func loadReviews(completion: @escaping (Result<Domain.Reviews, Error>) -> Void)
}
