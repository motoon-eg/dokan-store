//
//  File.swift
//  
//
//  Created by ziad on 04/07/2022.
//

import UIKit

extension UIButton{
    
    public enum ButtonStyle{
        case filled
        case primary
        case gray
    }
    
    public func applyBorderedProminentButtonStyle(_ style: ButtonStyle){
        titleLabel?.textColor  = UIColor.white
        titleLabel?.font = UIFont(name: "DMSans-Medium", size: 14)
        layer.cornerRadius = 10
        
        switch style {
        case .filled:
            backgroundColor = UIColor(named: "Blue Ocean")
        case .gray:
            backgroundColor = UIColor(named: "Half Gray")
        case .primary:
            layer.borderWidth = 1
            layer.borderColor = UIColor.black.cgColor
            backgroundColor = UIColor.white
        }

        // constraints
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    
    public func updateEnabledState(_ newValue : Bool){
        if newValue{
            isEnabled = true
            backgroundColor = UIColor(named: "Navy Black")
        }else{
            isEnabled = false
            backgroundColor = UIColor(named: "Half Gray")
        }
    }
    
}
