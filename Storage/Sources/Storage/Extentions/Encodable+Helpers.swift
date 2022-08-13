//
//  Encodable+Helpers.swift
//
//
//  Created by ziad on 13/08/2022.
//

import Foundation
extension Encodable {

    func encodeModelAsDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }

    func encodeModelAsArray() throws -> [[String: Any]] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else {
            throw NSError()
        }
        return dictionary
    }
}
