//
//  File.swift
//  
//
//  Created by ziad on 24/06/2022.
//

import Foundation
import UIKit

extension DesignSystem{
    enum TypoGraphy{
        case Title
        case Head
        case body
        case button
        
        private var fontDescriptor: CustomFontDescriptor{
            switch self {
            case .Title:
                return CustomFontDescriptor(font: .bold, size: 32, style: .title1)
            case .Head:
                return CustomFontDescriptor(font: .bold, size: 24, style: .headline)
            case .body:
                return CustomFontDescriptor(font: .regular, size: 14, style: .body)
            case .button:
                return CustomFontDescriptor(font: .bold, size: 14, style: .body)
            }
        }
        //Dynamic Font
        var font: UIFont{
            guard let font = UIFont(name: fontDescriptor.font.name, size: fontDescriptor.size) else { return UIFont.preferredFont(forTextStyle: fontDescriptor.style) }
            let fontMetrices = UIFontMetrics(forTextStyle: fontDescriptor.style)
            return fontMetrices.scaledFont(for: font)
        }
    }
}
