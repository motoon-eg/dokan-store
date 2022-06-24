//
//  File.swift
//  
//
//  Created by ziad on 24/06/2022.
//

import UIKit
enum AppError: LocalizedError {
    case invalidEmail ,
    invalidPassword ,
    invalidUserName ,
    invalidrepassword,
    invalidStateID,
    invalidCityID,
    invalidTerms,
    invalidImage,
    invalidPhone,
    invalidMatching,
    invalidCode,
    invalidTitle,
    invalidDescription,
    invalidMainImage,
    invalidImages,
    invalidArea,
    invalidAddress
    var errorDescription: String? {
        return failureReason
    }
    
    var failureReason: String?{
        switch self {
        case .invalidEmail:
            return "check valid Email".localized
        case .invalidPassword:
            return "check valid Password".localized
        case .invalidUserName:
            return "check valid Name".localized
        case .invalidrepassword:
            return "check valid Confirmation password".localized
        case .invalidCityID:
            return "check valid city".localized
        case .invalidTerms:
            return "you must accept terms and conditions".localized
        case .invalidStateID:
            return "check valid region".localized
        case .invalidImage:
            return "check valid image".localized
        case .invalidPhone:
            return "check valid phone".localized
        case .invalidMatching:
            return "invalid password Matching".localized
        case .invalidCode:
            return "invalid code".localized
        case .invalidTitle:
            return "invalid title".localized
        case .invalidDescription:
            return "invalid description".localized
        case .invalidMainImage:
            return "invalid main image".localized
        case .invalidImages:
            return "invalid images".localized
        case .invalidArea:
            return "invalid area".localized
        case .invalidAddress:
            return "invalid address".localized
        }
    }
}
