//
//  Caching.swift
//
//
//  Created by ziad on 11/08/2022.
//

import UIKit

extension Encodable {
    
    func asDictionary() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
            throw NSError()
        }
        return dictionary
    }

    func asArray() throws -> [[String: Any]] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [[String: Any]] else {
            throw NSError()
        }
        return dictionary
    }
    
}

let userKey = "userDataCash"

enum DokanDataActions {

    static func cashUserModel(user: User) {
        let userDictionary = try! user.asDictionary()

        UserDefaults.standard.set(userDictionary, forKey: userKey)
    }

    static func removeUserModel() {
        UserDefaults.standard.removeObject(forKey: userKey)
    }

    static func getUserModel() -> User? {
        if let cashedData = UserDefaults.standard.object(forKey: userKey) as? [String: Any] {
            let data = try! JSONSerialization.data(withJSONObject: cashedData, options: .prettyPrinted)

            let decoder = JSONDecoder()
            do {
                let user = try decoder.decode(User.self, from: data)
                return user
            } catch {
                return nil
            }
        }

        return nil
    }
}
