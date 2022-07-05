//
//  File.swift
//  
//
//  Created by marwa on 04/07/2022.
//

import Foundation
import UIKit

extension UILabel{
    
    public func titleLabel() {
        textColor = DesignSystem.Colors.navyBlack.color
        font = DesignSystem.TypoGraphy.RegisterTitle.font
    }
    
    public func bodyLabel() {
        textColor = DesignSystem.Colors.darkGrey.color
        font = DesignSystem.TypoGraphy.Body.font
    }
    
    public func textFieldDescriptionLabel() {
        textColor = DesignSystem.Colors.navyBlack.color
        font = DesignSystem.TypoGraphy.Body.font
    }
    
    public func categoriesTitleLabel() {
        textColor = DesignSystem.Colors.navyBlack.color
        font = DesignSystem.TypoGraphy.CategoriesTitle.font
    }
    
    public func productTitleLabel() {
        textColor = DesignSystem.Colors.navyBlack.color
        font = DesignSystem.TypoGraphy.ProductTitle_Btn_TF.font
    }
    
    public func productPriceLabel() {
        textColor = DesignSystem.Colors.redVelvet.color
        font = DesignSystem.TypoGraphy.ProductPrice.font
    }
    
    public func reviewsLabel() {
        textColor = DesignSystem.Colors.navyBlack.color
        font = DesignSystem.TypoGraphy.Reviews.font
    }
    
    public func coverTitleLabel() {
        textColor = DesignSystem.Colors.pureWhite.color
        font = DesignSystem.TypoGraphy.CoverTitle.font
    }
}
