//
//  File.swift
//  
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit


// MARK: - Style Helper
//
extension UIButton {
    
    public enum buttonStyle {
        case filledBlue
        case filledGray
        case filledRed
        case border
        case plainBlueProductTitle
        case plainBlueSmallButton
        case plainBlack
    }
    
    public func applyButtonStyle(_ style:buttonStyle) {
        switch style{
        case .filledBlue:
            filledBlueStyle()
        case .filledGray:
            filledGrayStyle()
        case .filledRed:
            filledRedStyle()
        case .border:
            BorderStyle()
        case .plainBlueProductTitle:
            plainBlueStyleProductTitle()
        case .plainBlueSmallButton:
            plainBlueStylesmallButton()
        case .plainBlack:
            plainBlackStyle()
        }
    }
}


// MARK: - Filled Buttons style
//
extension UIButton {
    
    private func filledPrimaryStyle() {
        // TODO: - ProductTitle_Btn_TF.font
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20)
        // TODO: - pureWhite.color
        tintColor = UIColor.white
        layer.cornerRadius = 12.0
        layer.masksToBounds = true
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func filledBlueStyle() {
        filledPrimaryStyle()
        // TODO: - blueOcean.color
        backgroundColor = UIColor.blue
    }
    
    private func filledGrayStyle() {
        filledPrimaryStyle()
        // TODO: - halfGrey.color
        backgroundColor = UIColor.lightGray
    }
    
    private func filledRedStyle() {
        filledPrimaryStyle()
        // TODO: - redVelvet.color
        backgroundColor = UIColor.red
        contentHorizontalAlignment = .left
    }
}


// MARK: - plain Buttons style
//
extension UIButton {
    
    private func plainStyle() {
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func plainBlueStyleProductTitle() {
        plainStyle()
        // TODO: - ProductTitle_Btn_TF.font
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20)
        // TODO: - blueOcean.color
        tintColor = UIColor.blue
        contentHorizontalAlignment = .right
    }
    
    private func plainBlueStylesmallButton() {
        plainStyle()
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20) // smallBtn.font
        // TODO: - blueOcean.color
        tintColor = UIColor.blue
        contentHorizontalAlignment = .left
    }
    
    private func plainBlackStyle() {
        plainStyle()
        // TODO: - ProductTitle_Btn_TF.font
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20)
        // TODO: - navyBlack.color
        tintColor = UIColor.black 
        contentHorizontalAlignment = .right
    }
}


//  MARK: - Border Buttons style
//
extension UIButton {
    
    private func BorderStyle() {
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
        // TODO: - ProductTitle_Btn_TF.font
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20)
        // TODO: - navyBlack.color
        tintColor = UIColor.black
        layer.borderWidth = 1
        // TODO: - navyBlack.color.cgColor
        layer.borderColor = UIColor.black.cgColor
        layer.cornerRadius = 12.0
        layer.masksToBounds = true
    }
}

