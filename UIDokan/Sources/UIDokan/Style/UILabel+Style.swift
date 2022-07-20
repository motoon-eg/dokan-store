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
    
    public func applyLabelStyle(_ style:labelStyle) {
        switch style {
        case .title:
            titleLabel()
        case .body:
            bodyLabel()
        case .textFieldTitle:
            textFieldTitleLabel()
        case .categoriesTitle:
            categoriesTitleLabel()
        case .productTitle:
            productPriceLabel()
        case .productPrice:
            productPriceLabel()
        case .reviews:
            reviewsLabel()
        case .coverTitle:
            coverTitleLabel()
        }
    }
}

extension UILabel{
    
    private func titleLabel() {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20) // RegisterTitle.font
    }
    
    private func bodyLabel() {
        textColor = UIColor.darkGray // darkGrey.color
        font = UIFont(name: UIFont.familyNames[0], size: 20) // Body.font
    }
    
    private func textFieldTitleLabel() {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20)// Body.font
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func categoriesTitleLabel() {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20) // CategoriesTitle.font
    }
    
    private func productTitleLabel() {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20) // ProductTitle_Btn_TF.font
    }
    
    private func productPriceLabel() {
        textColor = UIColor.red // redVelvet.color
        font = UIFont(name: UIFont.familyNames[0], size: 20) // ProductPrice.font
    }
    
    private func reviewsLabel() {
        textColor = UIColor.black // navyBlack.color
        font = UIFont(name: UIFont.familyNames[0], size: 20) // Reviews.font
    }
    
    private func coverTitleLabel() {
        textColor = UIColor.white // pureWhite.color
        font = UIFont(name: UIFont.familyNames[0], size: 20 ) // CoverTitle.font
    }
}
