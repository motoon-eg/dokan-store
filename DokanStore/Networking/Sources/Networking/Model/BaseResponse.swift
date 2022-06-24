//
//  BaseResponse.swift
//  DokanStore
//
//  Created by heba isaa on 24/06/2022.
//

import Foundation
struct BaseResponse<T:Decodable>: Decodable {
    let status: String
    let statusCode: Int
    let statusMessage: String
    let errors: [ErrorElement]?
    let data: T?

    enum CodingKeys: String, CodingKey {
        case status
        case statusCode = "status_code"
        case statusMessage = "status_message"
        case errors

        case  data
    }
}

// MARK: - Error
struct ErrorElement: Codable {
    let message: String
}
