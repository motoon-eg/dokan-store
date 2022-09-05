//
//  SellerInfoCell.swift
//  Dokan
//
//  Created by raniazeid on 17/08/2022.
//

import UIKit

class SellerInfoCell: UICollectionViewCell {
    // MARK: - Outlets..

    @IBOutlet private weak var sellerProductImage: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productPrice: UILabel!
    @IBOutlet private weak var productReviewRate: UILabel!
    @IBOutlet private weak var productReviewerCount: UILabel!

    // MARK: - Life cycle...

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - func to configure cell with data

    func configureCell(model: ViewModel) {
        sellerProductImage.setImage(with: model.image, placeholderImage: UIImage())
        productName.text = model.title
        productPrice.text = String(model.price)
        productReviewRate.text = String(model.review)
        productReviewerCount.text = String(model.totalReviews)
    }
}

// MARK: - Implement cell view model

extension SellerInfoCell {
    struct ViewModel {
        var title: String
        var image: String
        var price: Int
        var review: Double
        var totalReviews: Int
    }
}
