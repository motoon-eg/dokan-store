//
//  File.swift
//  
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit


let textField: UITextField = {
    let content = UITextField()
    content.translatesAutoresizingMaskIntoConstraints = false
    return content
}()

let label: UILabel = {
    let content = UILabel()
    content.translatesAutoresizingMaskIntoConstraints = false
    return content
}()

extension UIStackView {
    
    private func labelAndTextField(_ labelName: String, _ placeholder: String) {
        
        addSubview(label)
        label.topAnchor.constraint(equalTo: topAnchor, constant: 10).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        label.applyLabelStyle(.textFieldTitle, labelInfo: labelName)
        
        addSubview(textField)
        textField.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10).isActive = true
        textField.textFieldStyle(placeholder)
    }
    
    private func labelAndPasswordTextField(_ labelName: String, _ placeholder: String) {
        labelAndTextField(labelName, placeholder)
        textField.eye()
    }
    
}

extension UIStackView {
    
    public enum stackViewStyle {
        case labelAndTextField
        case labelAndPasswordTextField
    }
    
    public func applyStackViewStyle(_ style: stackViewStyle, labelName: String, placeholder: String) {
        switch style {
        case .labelAndTextField:
            labelAndTextField(labelName, placeholder)
        case .labelAndPasswordTextField:
            labelAndPasswordTextField(labelName, placeholder)
        }
    }
}
