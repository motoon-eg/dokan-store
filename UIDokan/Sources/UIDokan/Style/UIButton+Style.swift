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
public extension UIButton {

    enum buttonStyle {
        case filledBlue
        case filledGray
        case filledRed
        case border
        case plainBlueProductTitle
        case plainBlueSmallButton
        case plainBlack
    }

    func applyButtonStyle(_ style: buttonStyle) {
        switch style {
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
        tintColor = UIColor.pureWhite
        layer.cornerRadius = 12.0
        layer.masksToBounds = true
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    private func filledBlueStyle() {
        filledPrimaryStyle()
        backgroundColor = UIColor.blueOcean
    }

    private func filledGrayStyle() {
        filledPrimaryStyle()
        backgroundColor = UIColor.halfGrey
    }

    private func filledRedStyle() {
        filledPrimaryStyle()
        backgroundColor = UIColor.redVelvet
        contentHorizontalAlignment = .left
    }
}

// MARK: - plain Buttons style

//
extension UIButton {

    private func plainStyle() {
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 20),
        ])
    }

    private func plainBlueStyleProductTitle() {
        plainStyle()
        // TODO: - ProductTitle_Btn_TF.font
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20)
        tintColor = UIColor.blueOcean
        contentHorizontalAlignment = .right
    }

    private func plainBlueStylesmallButton() {
        plainStyle()
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20) // smallBtn.font
        tintColor = UIColor.blueOcean
        contentHorizontalAlignment = .left
    }

    private func plainBlackStyle() {
        plainStyle()
        // TODO: - ProductTitle_Btn_TF.font
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20)
        tintColor = UIColor.navyBlack
        contentHorizontalAlignment = .right
    }
}

// MARK: - Border Buttons style

extension UIButton {

    private func BorderStyle() {
        backgroundColor = .clear
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48),
        ])
        // TODO: - ProductTitle_Btn_TF.font
        titleLabel?.font = UIFont(name: UIFont.familyNames[0], size: 20)
        tintColor = UIColor.navyBlack
        layer.borderWidth = 1
        layer.borderColor = UIColor.navyBlack.cgColor
        layer.cornerRadius = 12.0
        layer.masksToBounds = true
    }
}
