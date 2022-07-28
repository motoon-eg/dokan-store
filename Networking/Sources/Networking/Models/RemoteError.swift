//
//  File.swift
//  
//
//  Created by Ahmed M. Hassan on 18/06/2022.
//

import Foundation

public enum RemoteError: Error, Decodable, Equatable {
    
    /// Missing Token!
    ///
    case unauthorized

    /// We're not properly authenticated
    ///
    case invalidToken

    /// Unknown: Represents an unmapped remote error. Capisce?
    ///
    case unknown(code: String, message: String?)
    
    /// Decodable Initializer.
    ///
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let error = try container.decode(String.self, forKey: .error)
        let message = try container.decodeIfPresent(String.self, forKey: .message)

        switch error {
        case Constants.invalidToken:
            self = .invalidToken
        case Constants.unauthorized:
            self = .unauthorized
        case Constants.unauthorized:
            self = .unauthorized
        default:
            self = .unknown(code: error, message: message)
        }
    }
    
    /// Constants for Possible Error Identifiers
    ///
    private enum Constants {
        static let unauthorized     = "unauthorized"
        static let invalidToken     = "invalid_token"
    }

    /// Coding Keys
    ///
    private enum CodingKeys: String, CodingKey {
        case error
        case message
    }
}

// MARK: - Equatable Conformance
//
public func ==(lhs: RemoteError, rhs: RemoteError) -> Bool {
    switch (lhs, rhs) {
    case (.unauthorized, .unauthorized):
        return true
    case (.invalidToken, .invalidToken):
        return true
    case let (.unknown(codeLHS, _), .unknown(codeRHS, _)):
        return codeLHS == codeRHS
    default:
        return false
    }
}
