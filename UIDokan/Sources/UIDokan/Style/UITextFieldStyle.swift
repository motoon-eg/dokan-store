//
//  File.swift
//  
//
//  Created by marwa on 03/07/2022.
//

import Foundation
import UIKit

extension UITextField {
    
   private func textFieldStyle() {
        backgroundColor = DesignSystem.Colors.offGrey.color
        layer.cornerRadius = 10
        layer.masksToBounds = true
        textColor = DesignSystem.Colors.navyBlack.color
        font = DesignSystem.TypoGraphy.ProductTitle_Btn_TF.font
        let placeHolderText = placeholder ?? ""
        let str = NSAttributedString(string:placeHolderText, attributes: [NSAttributedString.Key.foregroundColor :DesignSystem.Colors.halfGrey.color,  NSAttributedString.Key.font : DesignSystem.TypoGraphy.Body.font])
         attributedPlaceholder = str
        leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: frame.height))
        leftViewMode = .always
        }
    
    public func password() {
        textFieldStyle()
        isSecureTextEntry = true
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 54, height: frame.height))
        rightViewMode = .always
        frame.size = CGSize(width: 325, height: 50)
    }
    
    public func email_Phone_Code_Name() {
        textFieldStyle()
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: frame.height))
        rightViewMode = .always
        frame.size = CGSize(width: 325, height: 50)
    }
    
    public func verificationCode() {
        rightView = UIView(frame: CGRect(x: 0, y: 0, width: 19, height: frame.height))
        rightViewMode = .always
        frame.size = CGSize(width: 325, height: 50)
        
    }
        
    }
