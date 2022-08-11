//
//  ServiceLocator.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Core
import Foundation
import Networking

/// Provide access to application services. Why private properties? Unit-testing!
///
class ServiceLocator {

    /// Alamofire networking
    ///
    private static var _networking: Network = AlamofireNetwork()

    // MARK: Accessible Services

    /// Provide access to default `Networking`
    ///
    static var networking: Network {
        return _networking
    }
}

// MARK: Testing

//
extension ServiceLocator {

    static func setTestNetworking(_ networking: Network) {
        guard NSClassFromString("XCTest") != nil else {
            return
        }

        _networking = networking
    }
}
