//
//  File.swift
//  
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit


extension UIButton {
    
    public enum buttonStyle {
        case filledBlue
        case filledGray
        case filledRed
        case border
        case plainBlueProductTitle
        case plainBlueSmallBtn
        case plainBlack
    }
    
    public func applyButtonStyle(_ style:buttonStyle, buttonName: String) {
        switch style{
        case .filledBlue:
            filledBlueStyle(buttonName)
        case .filledGray:
            filledGrayStyle(buttonName)
        case .filledRed:
            filledRedStyle(buttonName)
        case .border:
            BorderStyle(buttonName)
        case .plainBlueProductTitle:
            plainBlueStyleProductTitle(buttonName)
        case .plainBlueSmallBtn:
            plainBlueStylesmallButton(buttonName)
        case .plainBlack:
            plainBlackStyle(buttonName)
        }
    }
}



extension UIButton {
    
    // MARK: - Filled Buttons style
    private func filledPrimaryStyle(_ buttonTitle: String) {
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20 ) // ProductTitle_Btn_TF.font
        tintColor = UIColor.white// pureWhite.color
        setTitle(buttonTitle, for: .normal)
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute  , multiplier: 1, constant: 48)
        addConstraint(heightConstraint)
    }
    
    private func filledBlueStyle(_ buttonTitle: String) {
        filledPrimaryStyle(buttonTitle)
        backgroundColor = UIColor.blue // blueOcean.color
    }
    
    private func filledGrayStyle(_ buttonTitle: String) {
        filledPrimaryStyle(buttonTitle)
        backgroundColor = UIColor.lightGray // halfGrey.color
    }
    
    private func filledRedStyle(_ buttonTitle: String) {
        filledPrimaryStyle(buttonTitle)
        backgroundColor = UIColor.red // redVelvet.color
        contentHorizontalAlignment = .left
    }
    
    //  MARK: - plain Buttons style
    
    private func plainStyle(_ buttonTitle: String) {
        backgroundColor = .clear
        setTitle(buttonTitle, for: .normal)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute  , multiplier: 1, constant: 20)
        addConstraint(heightConstraint)
    }
    
    private func plainBlueStyleProductTitle(_ buttonTitle: String) {
        plainStyle(buttonTitle)
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20 )// ProductTitle_Btn_TF.font
        tintColor = UIColor.blue // blueOcean.color
        contentHorizontalAlignment = .right
    }
    
    private func plainBlueStylesmallButton(_ buttonTitle: String) {
        plainStyle(buttonTitle)
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20 ) // smallBtn.font
        tintColor = UIColor.blue // blueOcean.color
        contentHorizontalAlignment = .left
    }
    
    private func plainBlackStyle(_ buttonTitle: String) {
        plainStyle(buttonTitle)
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20 ) // ProductTitle_Btn_TF.font
        tintColor = UIColor.black // navyBlack.color
        contentHorizontalAlignment = .right
    }
    
    //  MARK: - Border Buttons style
    
    private func BorderStyle(_ buttonTitle: String) {
        backgroundColor = .clear
        setTitle(buttonTitle, for: .normal)
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute  , multiplier: 1, constant: 48)
        addConstraint(heightConstraint)
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20 ) // ProductTitle_Btn_TF.font
        tintColor = UIColor.black // navyBlack.color
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor // navyBlack.color.cgColor
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
}

