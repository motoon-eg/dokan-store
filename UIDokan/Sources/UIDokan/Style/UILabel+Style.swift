//
//  File.swift
//
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit

public extension UILabel {

    enum labelStyle {
        case title
        case body
        case textFieldTitle
        case categoriesTitle
        case productTitle
        case productPrice
        case reviews
        case coverTitle
    }

    func applyLabelStyle(_ style: labelStyle) {
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

extension UILabel {

    private func titleLabel() {
        textColor = UIColor.navyBlack
        // TODO: - RegisterTitle.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }

    private func bodyLabel() {
        textColor = UIColor.darkGrey
        // TODO: - Body.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }

    private func textFieldTitleLabel() {
        textColor = UIColor.navyBlack
        // TODO: - Body.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
        NSLayoutConstraint.activate([
            heightAnchor.constraint(equalToConstant: 48),
        ])
    }

    private func categoriesTitleLabel() {
        textColor = UIColor.navyBlack
        // TODO: - CategoriesTitle.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }

    private func productTitleLabel() {
        textColor = UIColor.navyBlack
        // TODO: - ProductTitle_Btn_TF.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }

    private func productPriceLabel() {
        textColor = UIColor.redVelvet
        // TODO: - ProductPrice.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }

    private func reviewsLabel() {
        textColor = UIColor.navyBlack
        // TODO: - Reviews.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }

    private func coverTitleLabel() {
        textColor = UIColor.pureWhite
        // TODO: - CoverTitle.font
        font = UIFont(name: UIFont.familyNames[0], size: 20)
    }
}
