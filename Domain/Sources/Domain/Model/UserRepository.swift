//
//  File.swift
//
//
//  Created by heba isaa on 02/07/2022.
//

import Foundation

protocol UserRepository {
    func fetchUserData() -> [User]
}
