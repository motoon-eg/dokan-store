//
//  File.swift
//  
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit

extension UILabel {
    
    public enum labelStyle {
        case title
        case body
        case textFieldTitle
        case categoriesTitle
        case productTitle
        case productPrice
        case reviews
        case coverTitle
    }
    
    public func applyLabelStyle(_ style:labelStyle, labelInfo: String) {
        switch style {
        case .title:
            titleLabel(labelInfo)
        case .body:
            bodyLabel(labelInfo)
        case .textFieldTitle:
            textFieldTitleLabel(labelInfo)
        case .categoriesTitle:
            categoriesTitleLabel(labelInfo)
        case .productTitle:
            productPriceLabel(labelInfo)
        case .productPrice:
            productPriceLabel(labelInfo)
        case .reviews:
            reviewsLabel(labelInfo)
        case .coverTitle:
            coverTitleLabel(labelInfo)
        }
    }
}

extension UILabel{
    
    private func titleLabel(_ title: String) {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 ) // RegisterTitle.font
        text = title
    }
    
    private func bodyLabel(_ body: String) {
        textColor = UIColor.darkGray // darkGrey.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 ) // Body.font
        text = body
    }
    
    private func textFieldTitleLabel(_ textFieldTitle: String) {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 )// Body.font
        text = textFieldTitle
        let heightConstraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute  , multiplier: 1, constant: 48)
        addConstraint(heightConstraint)
    }
    
    private func categoriesTitleLabel(_ categoriesTitle: String) {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 ) // CategoriesTitle.font
        text = categoriesTitle
    }
    
    private func productTitleLabel(_ productTitle: String) {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 ) // ProductTitle_Btn_TF.font
        text = productTitle
    }
    
    private func productPriceLabel(_ productPrice: String) {
        textColor = UIColor.red // redVelvet.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 ) // ProductPrice.font
        text = productPrice
    }
    
    private func reviewsLabel(_ reviews: String) {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 ) // Reviews.font
        text = reviews
    }
    
    private func coverTitleLabel(_ coverTitle: String) {
        textColor = UIColor.white // pureWhite.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 ) // CoverTitle.font
        text = coverTitle
    }
}
