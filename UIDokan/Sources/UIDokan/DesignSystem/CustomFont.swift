//
//  File.swift
//  
//
//  Created by ziad on 05/07/2022.
//

import UIKit
struct CustomFontDescriptor{
    let font: Font
    let size: CGFloat
    let style: UIFont.TextStyle
}
enum Font: String{
    case regular = "DMSans-Regular"
    case medium = "DMSans-Medium"
    case bold = "DMSans-Bold"
    
    var name: String{
        return self.rawValue
    }
}
