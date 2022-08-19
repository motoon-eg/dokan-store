//
//  SellerInfoCell.swift
//  Dokan
//
//  Created by raniazeid on 17/08/2022.
//

import UIKit

class SellerInfoCell: UICollectionViewCell {
    // MARK: - outlets..

    @IBOutlet private weak var sellerProductImage: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productPrice: UILabel!
    @IBOutlet private weak var productReviewRate: UILabel!
    @IBOutlet private weak var productReviewerCount: UILabel!

    // MARK: - life cycle...

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - func to configure cell with data

    func configureCell(model: SellerInfoCellModel) {
        sellerProductImage.setImage(with: model.sellerProductImage, placeholderImage: UIImage(named: "")!)
        productName.text = model.productName
        productPrice.text = model.productPrice
        productReviewRate.text = model.productReviewRate
        productReviewerCount.text = model.productReviewerCount
    }
}

// MARK: - implement cell view model

extension SellerInfoCell {
    struct SellerInfoCellModel {
        var sellerProductImage: String
        var productName: String
        var productPrice: String
        var productReviewRate: String
        var productReviewerCount: String
    }
}
