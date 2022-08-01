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
        // TODO: - navyBlack.color
        textColor = UIColor.black
        // TODO: - RegisterTitle.font
        font = UIFont(name: UIFont.familyNames[0], size: 20) 
    }
    
    private func bodyLabel() {
        // TODO: - darkGrey.color
        textColor = UIColor.darkGray
        // TODO: - Body.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }
    
    private func textFieldTitleLabel() {
        // TODO: - navyBlack.color
        textColor = UIColor.black
        // TODO: - Body.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48)
        ])
    }
    
    private func categoriesTitleLabel() {
        // TODO: - navyBlack.color
        textColor = UIColor.black
        // TODO: - CategoriesTitle.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }
    
    private func productTitleLabel() {
        // TODO: - navyBlack.color
        textColor = UIColor.black
        // TODO: - ProductTitle_Btn_TF.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }
    
    private func productPriceLabel() {
        // TODO: - redVelvet.color
        textColor = UIColor.red
        // TODO: - ProductPrice.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }
    
    private func reviewsLabel() {
        // TODO: - navyBlack.color
        textColor = UIColor.black
        // TODO: - Reviews.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }
    
    private func coverTitleLabel() {
        // TODO: - pureWhite.color
        textColor = UIColor.white
        // TODO: - CoverTitle.font
        font = UIFont(name: UIFont.familyNames[0], size: 20 )
    }
}
