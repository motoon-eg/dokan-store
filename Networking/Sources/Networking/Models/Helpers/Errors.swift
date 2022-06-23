//
//  File.swift
//  
//
//  Created by Omar Ahmed on 23/06/2022.
//

import Foundation

public enum GeneralErrors: Error {
    case connection
    case callingAPI
    case failedData
}

public enum AuthErrors: Error {
    case invalidToken
    case unauthorized
}
