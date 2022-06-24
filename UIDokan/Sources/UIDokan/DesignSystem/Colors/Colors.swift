//
//  File.swift
//  
//
//  Created by ziad on 24/06/2022.
//

import Foundation
import UIKit

extension DesignSystem{
    enum Colors: String{
        case primaryColor = "primary"
        case secondaryColor = "secondary"
        case orangePrimary = "orangePrimary"
        case subTitle = "subTitle"
        case textGray = "textGray"
        

        var color: UIColor{
            switch self {
            case .primaryColor:
                return UIColor(named: self.rawValue)!
            case .secondaryColor:
                return UIColor(named: self.rawValue)!
            case .orangePrimary:
                return UIColor(named: self.rawValue)!
            case .subTitle:
                return UIColor(named: self.rawValue)!
            case .textGray:
                return UIColor(named: self.rawValue)!
            }
        }
    }
}
