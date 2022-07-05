//
//  File.swift
//  
//
//  Created by marwa on 03/07/2022.
//

import Foundation
import UIKit


extension UIButton {
    
    // MARK: - Filled Buttons style
    
    private func filledPrimaryStyle() {
        titleLabel?.font = DesignSystem.TypoGraphy.ProductTitle_Btn_TF.font
        tintColor = DesignSystem.Colors.pureWhite.color
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
    
    public func filledBlueStyle() {
        filledPrimaryStyle()
        backgroundColor = DesignSystem.Colors.blueOcean.color
        frame.size = CGSize(width: 325, height: 50)
    }
    
    public func filledGrayStyle() {
        filledPrimaryStyle()
        backgroundColor = DesignSystem.Colors.halfGrey.color
        frame.size = CGSize(width: 325, height: 50)
    }
    
    public func filledRedStyle() {
        filledPrimaryStyle()
        backgroundColor = DesignSystem.Colors.redVelvet.color
        frame.size = CGSize(width: 153, height: 50)
        contentHorizontalAlignment = .left
    }
    
    public func filledBlueStyle_follow() {
        filledPrimaryStyle()
        backgroundColor = DesignSystem.Colors.blueOcean.color
        frame.size = CGSize(width: 130, height: 50)
    }
    
    public func filledBlueStyle_apply() {
        filledPrimaryStyle()
        backgroundColor = DesignSystem.Colors.blueOcean.color
        frame.size = CGSize(width: 153, height: 50)
    }
    
    public func filledBlueStyle_addToCart() {
        filledPrimaryStyle()
        backgroundColor = DesignSystem.Colors.blueOcean.color
        frame.size = CGSize(width: 275, height: 50)
    }
    
    // MARK: - plain Buttons style
    
    public func plainBlueStyleSignUp() {
        backgroundColor = .clear
        frame.size = CGSize(width: 50, height: 18)
        titleLabel?.font = DesignSystem.TypoGraphy.ProductTitle_Btn_TF.font
        tintColor = DesignSystem.Colors.blueOcean.color
        contentHorizontalAlignment = .right
    }
    
    public func plainBlueStyleSeeAll() {
        backgroundColor = .clear
        frame.size = CGSize(width: 39, height: 22)
        titleLabel?.font = DesignSystem.TypoGraphy.smallBtn.font
        tintColor = DesignSystem.Colors.blueOcean.color
        contentHorizontalAlignment = .left
    }
    public func plainBlueStyleResendCode() {
        backgroundColor = .clear
        frame.size = CGSize(width: 96, height: 19)
        titleLabel?.font = DesignSystem.TypoGraphy.ProductTitle_Btn_TF.font
        tintColor = DesignSystem.Colors.blueOcean.color
        contentHorizontalAlignment = .right
    }
    
    public func plainBlackStyle() {
        backgroundColor = .clear
        frame.size = CGSize(width: 109, height: 18)
        titleLabel?.font = DesignSystem.TypoGraphy.ProductTitle_Btn_TF.font
        tintColor = DesignSystem.Colors.navyBlack.color
        contentHorizontalAlignment = .right
    }
    
    // MARK: - Border Buttons style
    
    private func BorderStyle() {
        backgroundColor = .clear
        titleLabel?.font = DesignSystem.TypoGraphy.ProductTitle_Btn_TF.font
        tintColor = DesignSystem.Colors.navyBlack.color
        layer.borderWidth = 1
        layer.borderColor = DesignSystem.Colors.navyBlack.color.cgColor
        layer.cornerRadius = 10.0
        layer.masksToBounds = true
    }
    
    public func BorderStyleLong() {
        BorderStyle()
        frame.size = CGSize(width: 325, height: 50)
    }
    
    public func BorderStyleReset() {
        BorderStyle()
        frame.size = CGSize(width: 130, height: 50)
    }
    
    public func BorderStyleSorting() {
        BorderStyle()
        frame.size = CGSize(width: 153, height: 50)
    }
}
