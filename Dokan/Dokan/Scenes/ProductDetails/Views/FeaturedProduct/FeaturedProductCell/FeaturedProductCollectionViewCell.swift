//
//  FeaturedProductCollectionViewCell.swift
//  Dokan
//
//  Created by marwa on 26/07/2022.
//

import UIKit

class FeaturedProductCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlets

    @IBOutlet weak var styleView: UIView!
    @IBOutlet private(set) weak var productImage: UIImageView!
    @IBOutlet private(set) weak var productName: UILabel!
    @IBOutlet private(set) weak var productPrice: UILabel!
    @IBOutlet private(set) weak var rateImage: UIImageView!
    @IBOutlet private(set) weak var rateNumber: UILabel!
    @IBOutlet private(set) weak var reviewsNumber: UILabel!
    @IBOutlet private(set) weak var moreButton: UIButton!

    // MARK: - Properties

    // MARK: - initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        makeStyleForCell()
    }

    func configureFeaturedCell(product: FeaturedProduct) {
        productName.text = product.title
        productPrice.text = "$ " + product.price
        productImage.setImage(with: product.image)
    }

    // MARK: - private handler

    private func makeStyleForCell() {
        styleView.layer.masksToBounds = true
        styleView.layer.cornerRadius = 5
        styleView.layer.shadowColor = UIColor.gray.withAlphaComponent(0.3).cgColor
        styleView.layer.shadowOffset = CGSize(width: 0, height: 4)
        styleView.layer.shadowOpacity = 1
        styleView.layer.shadowRadius = 5
    }
}

// MARK: - Binding

extension FeaturedProductCollectionViewCell {

    func bindMoreButton() {
        moreButton.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }
}

// MARK: - Actions

extension FeaturedProductCollectionViewCell {

    @objc func buttonWasTapped() {
        // navigate to more
    }
}
