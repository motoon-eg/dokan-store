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

let titleLabel: UILabel = {
    let content = UILabel()
    content.translatesAutoresizingMaskIntoConstraints = false
    return content
}()

let bodyLabel: UILabel = {
    let content = UILabel()
    content.translatesAutoresizingMaskIntoConstraints = false
    return content
}()

extension UIStackView {
    
    private func labelAndTextField(_ labelName: String, _ placeholder: String) {
        
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        titleLabel.applyLabelStyle(.textFieldTitle, labelInfo: labelName)
        
        addSubview(textField)
        textField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        textField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        textField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        textField.textFieldStyle(placeholder)
    }
    
    private func labelAndPasswordTextField(_ labelName: String, _ placeholder: String) {
        labelAndTextField(labelName, placeholder)
        textField.eye()
    }
    
    private func titleLabelAndBodyLabel(_ title: String, _ body: String) {
        addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        titleLabel.applyLabelStyle(.title, labelInfo: title)
        
        addSubview(bodyLabel)
        bodyLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
        bodyLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        bodyLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
        bodyLabel.applyLabelStyle(.body, labelInfo: body)
        
    }
}

extension UIStackView {
    
    public enum stackViewStyle {
        case labelAndTextField
        case labelAndPasswordTextField
        case titleLabelAndBodyLabel
    }
    
    public func applyStackViewStyle(_ style: stackViewStyle, labelTitle: String, placeholderOrLabelBody: String) {
        switch style {
        case .labelAndTextField:
            labelAndTextField(labelTitle, placeholderOrLabelBody)
        case .labelAndPasswordTextField:
            labelAndPasswordTextField(labelTitle, placeholderOrLabelBody)
        case .titleLabelAndBodyLabel:
            titleLabelAndBodyLabel(labelTitle, placeholderOrLabelBody)
        }
    }
}
