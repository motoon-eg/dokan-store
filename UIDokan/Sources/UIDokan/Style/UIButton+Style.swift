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
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20) // ProductTitle_Btn_TF.font
        tintColor = UIColor.white// pureWhite.color
        layer.cornerRadius = 12.0
        layer.masksToBounds = true
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func filledBlueStyle() {
        filledPrimaryStyle()
        backgroundColor = UIColor.blue // blueOcean.color
    }
    
    private func filledGrayStyle() {
        filledPrimaryStyle()
        backgroundColor = UIColor.lightGray // halfGrey.color
    }
    
    private func filledRedStyle() {
        filledPrimaryStyle()
        backgroundColor = UIColor.red // redVelvet.color
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
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20)// ProductTitle_Btn_TF.font
        tintColor = UIColor.blue // blueOcean.color
        contentHorizontalAlignment = .right
    }
    
    private func plainBlueStylesmallButton() {
        plainStyle()
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20) // smallBtn.font
        tintColor = UIColor.blue // blueOcean.color
        contentHorizontalAlignment = .left
    }
    
    private func plainBlackStyle() {
        plainStyle()
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20) // ProductTitle_Btn_TF.font
        tintColor = UIColor.black // navyBlack.color
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
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20) // ProductTitle_Btn_TF.font
        tintColor = UIColor.black // navyBlack.color
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor // navyBlack.color.cgColor
        layer.cornerRadius = 12.0
        layer.masksToBounds = true
    }
}

