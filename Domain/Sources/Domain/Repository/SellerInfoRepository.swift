//
//  File.swift
//
//
//  Created by raniazeid on 30/08/2022.
//

import Foundation
/// All Seller Info  related use cases
///
public protocol SellerInfoRepository {

    /// Load all seller info at a page. Completes with products list or error if any.
    ///
    func loadSellerInfo(completion: @escaping (Result<SellerInfo, Error>) -> Void)
}
