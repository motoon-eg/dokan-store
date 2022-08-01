//
//  File.swift
//  
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit


extension UITextField {
    
    public func applyRoundedtextFieldStyle() {
        // TODO: - offGrey.color
        backgroundColor = UIColor.lightGray
        layer.cornerRadius = 12
        layer.masksToBounds = true
        // TODO: - navyBlack.color
        textColor = UIColor.black
        // TODO: - ProductTitle_Btn_TF.font
        font = UIFont(name: UIFont.familyNames[0], size: 20) 
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
        let paddingView = UIView(frame: CGRect(x: 0,y: 0,width: 20,height: self.frame.height))
        leftView = paddingView
        leftViewMode = .always
    }
    
}
