//
//  File.swift
//  
//
//  Created by Omar Ahmed on 23/06/2022.
//

import Foundation

enum GeneralErrors: Error {
    case connection
    case callingAPI
    case failedData
}

enum AuthErrors: Error {
    case invalidToken
    case unauthorized
}
