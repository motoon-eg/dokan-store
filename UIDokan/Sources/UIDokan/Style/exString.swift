//
//  File.swift
//  
//
//  Created by ziad on 24/06/2022.
//

import UIKit
extension String{
    var trimmed: String{
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    var isValidEmail: Bool{
        let emailFormat="[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z](2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %0", emailFormat)
        return emailPredicate.evaluate(with: self)
    }
    var isValidPassword: Bool {
    //Regex restricts to 8 character minimum, 1 capital letter, 1 lowercase letter, 1 number
    let passwordFormat = "(?=.*[A-Z]) (?=.*[0-9]) (?=.*[a-z]). {8,} "
    let passwordPredicate = NSPredicate(format: "SELF MATCHES %", passwordFormat)
    return passwordPredicate.evaluate(with: self)
    }
    func underLine(color: UIColor = .white, font: String = "Almarai-Bold", fontSize: CGFloat = 18) -> NSMutableAttributedString{
        let yourAttributes: [NSAttributedString.Key: Any] = [
            .font: UIFont(name: font, size: fontSize) as Any,
            .foregroundColor: color ,
            .underlineStyle: NSUnderlineStyle.single.rawValue
        ]
        
        let attributeString = NSMutableAttributedString(
           string: self,
           attributes: yourAttributes
        )
        return attributeString
    }
    func strikeThrough() -> NSAttributedString {
        let attributeString =  NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0,attributeString.length))
        return attributeString
    }
    
}
