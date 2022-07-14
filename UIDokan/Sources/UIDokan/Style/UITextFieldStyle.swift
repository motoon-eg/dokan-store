//
//  File.swift
//  
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit


extension UITextField {
    
    public func textFieldStyle(_ placeHolder: String) {
        backgroundColor = UIColor.lightGray // offGrey.color
        layer.cornerRadius = 10
        layer.masksToBounds = true
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 ) // ProductTitle_Btn_TF.font
        let placeHolderText = placeHolder
        let str = NSAttributedString(string:placeHolderText, attributes: [NSAttributedString.Key.foregroundColor :UIColor.darkGray /*halfGrey.color*/,  NSAttributedString.Key.font : UIFont(name: UIFont.familyNames[0], size: 20 )])
        attributedPlaceholder = str
        rightViewMode = .always
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute  , multiplier: 1, constant: 48)
        addConstraint(heightConstraint)
    }
        
}
