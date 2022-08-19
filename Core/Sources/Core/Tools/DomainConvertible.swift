//
//  File.swift
//
//
//  Created by Ahmed M. Hassan on 12/08/2022.
//

import Foundation

/// Any model to be converted to domain should conform to the same protocol
///
protocol DomainConvertible {
    associatedtype DomainType

    /// Used to convert any model to a corresponding domain model
    ///
    func toDomain() -> DomainType
}
