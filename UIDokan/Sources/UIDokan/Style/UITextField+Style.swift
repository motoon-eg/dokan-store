//
//  File.swift
//  
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit


extension UITextField {
    
    public func textFieldStyle() {
        backgroundColor = UIColor.lightGray // offGrey.color
        layer.cornerRadius = 12
        layer.masksToBounds = true
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20) // ProductTitle_Btn_TF.font
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
        let paddingView = UIView(frame: CGRect(x: 0,y: 0,width: 20,height: self.frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
}
