//
//  File.swift
//  
//
//  Created by ziad on 04/07/2022.
//

import UIKit
public struct DesignSystem{
    
    
    //MARK: - Colors
    public enum Colors: String{
        // Primary
        case blueOcean = "Blue Ocean"
        case orangeFresh = "Orange Fresh"
        case navyBlack = "Navy Black"
        case pureWhite = "Pure White"
        // Secondary
        case earthGreen = "Earth Green"
        case redVelvet = "Red Velvet"
        case darkGrey = "darkGrey"
        case halfGrey = "Half Grey"
        case softGrey = "Soft Grey"
        case offGrey = "Off Grey"
        // Label
        case offBlue = "Off Blue"
        case offGreen = "Off Green"
        case offRed = "Off Red"
        
        public var color: UIColor{
            switch self {
            case .blueOcean:
                return UIColor(named: self.rawValue)!
            case .orangeFresh:
                return UIColor(named: self.rawValue)!
            case .navyBlack:
                return UIColor(named: self.rawValue)!
            case .pureWhite:
                return UIColor(named: self.rawValue)!
            case .earthGreen:
                return UIColor(named: self.rawValue)!
            case .redVelvet:
                return UIColor(named: self.rawValue)!
            case .darkGrey:
                return UIColor(named: self.rawValue)!
            case .halfGrey:
                return UIColor(named: self.rawValue)!
            case .softGrey:
                return UIColor(named: self.rawValue)!
            case .offGrey:
                return UIColor(named: self.rawValue)!
            case .offBlue:
                return UIColor(named: self.rawValue)!
            case .offGreen:
                return UIColor(named: self.rawValue)!
            case .offRed:
                return UIColor(named: self.rawValue)!
            }
        }
    }
    
    // MARK: - TypoGraphy
    public enum TypoGraphy{
        // Bold
        case RegisterTitle
        case CoverTitle
        case ProductPrice
        // meduim
        case smallBtn
        case ProductTitle_Btn_TF
        case CategoriesTitle
        // Regular
        case Body
        case Reviews
        
        private var fontDescriptor: CustomFontDescriptor{
            switch self {
                // bold
            case .RegisterTitle:
                return CustomFontDescriptor(font: .bold, size: 25, style: .title1)
            case .CoverTitle:
                return CustomFontDescriptor(font: .bold, size: 20, style: .headline)
            case .ProductPrice:
                return CustomFontDescriptor(font: .bold, size: 12, style: .body)
                // meduim
            case .smallBtn:
                return CustomFontDescriptor(font: .medium, size: 12, style: .body)
            case .ProductTitle_Btn_TF:
                return CustomFontDescriptor(font: .medium, size: 14, style: .body)
            case .CategoriesTitle:
                return CustomFontDescriptor(font: .medium, size: 16, style: .body)
                // regular
            case .Body:
                return CustomFontDescriptor(font: .regular, size: 14, style: .body)
            case .Reviews:
                return CustomFontDescriptor(font: .regular, size: 10, style: .body)
            }
        }
        //Dynamic Font
        public var font: UIFont{
            guard let font = UIFont(name: fontDescriptor.font.name, size: fontDescriptor.size) else { return UIFont.preferredFont(forTextStyle: fontDescriptor.style) }
            let fontMetrices = UIFontMetrics(forTextStyle: fontDescriptor.style)
            return fontMetrices.scaledFont(for: font)
        }
    }
    
}
