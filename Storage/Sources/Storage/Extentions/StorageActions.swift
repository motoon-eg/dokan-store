//
//  File.swift
//
//
//  Created by ziad on 13/08/2022.
//

import Foundation

/// you will need to write here the model you want to store
/// use the assocciate value as key to get or remove the model data
enum modelsKey: String {
    case User
    case Products
    case Auth
}

protocol DokanDataActionsProtcol {

    func cacheModel<Model: Codable>(model: Model, key: modelsKey)
    func getData<Model: Codable>(fromKey: modelsKey) -> Model?
    func removeModel(withKey: modelsKey)
}

class DokanDataActions: DokanDataActionsProtcol {

    func getData<Model>(fromKey: modelsKey) -> Model? where Model: Decodable, Model: Encodable {
        if let cachedData = UserDefaults.standard.object(forKey: fromKey.rawValue) as? [String: Any] {
            let data = try? JSONSerialization.data(withJSONObject: cachedData, options: .prettyPrinted)
            let decoder = JSONDecoder()
            do {
                guard let data = data else { return nil }
                let modelData = try decoder.decode(Model.self, from: data)
                return modelData
            } catch {
                return nil
            }
        }
        return nil
    }

    func cacheModel<Model>(model: Model, key: modelsKey) where Model: Encodable {
        do {
            let modelCachingType = try model.encodeModelAsDictionary()
            UserDefaults.standard.set(modelCachingType, forKey: key.rawValue)
        } catch {
            assertionFailure("can't cache \(model)")
        }
    }

    func removeModel(withKey: modelsKey) {
        UserDefaults.standard.removeObject(forKey: withKey.rawValue)
    }
}
