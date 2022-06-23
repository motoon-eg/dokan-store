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
}

enum AuthErrors: Error {
    case invalidToken
    case unauthorized
}
