//
//  Repositories.swift
//  Dokan
//
//  Created by Clara Mounir Adly on 23/06/2022.
//

import Foundation
// MARK: - Repository
struct Repository: Codable {
    let name: String
    let htmlURL: String
    let repositoryDescription: String?
    let createdAt: String
}

extension Repository {
    enum CodingKeys: String, CodingKey {
        case name
        case htmlURL = "html_url"
        case repositoryDescription = "description"
        case createdAt = "created_at"
    }
}
