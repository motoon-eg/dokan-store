//
//  ServiceLocator.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Core
import Domain
import Foundation
import Networking

/// Provide access to application services. Why private properties? Unit-testing!
///
class ServiceLocator {

    /// Alamofire networking
    ///
    private static var _networking: Network = AlamofireNetwork()

    /// Repository provider
    ///
    private static var _provider: RepositoryProvider = DefaultRepositoryProvider(network: networking)

    // MARK: Accessible Services

    /// Provide access to default `Networking`
    ///
    static var networking: Network {
        return _networking
    }

    /// Provide access to default `RepositoryProvider`
    ///
    static var provider: RepositoryProvider {
        return _provider
    }
}

// MARK: Testing

extension ServiceLocator {

    static func setTestNetworking(_ networking: Network) {
        guard NSClassFromString("XCTest") != nil else {
            return
        }

        _networking = networking
    }
}
