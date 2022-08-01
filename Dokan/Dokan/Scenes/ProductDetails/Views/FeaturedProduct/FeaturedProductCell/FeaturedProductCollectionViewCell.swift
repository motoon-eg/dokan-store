//
//  FeaturedProductCollectionViewCell.swift
//  Dokan
//
//  Created by marwa on 26/07/2022.
//

import UIKit

class FeaturedProductCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet private(set) weak var productImage: UIImageView!
    @IBOutlet private(set) weak var productName: UILabel!
    @IBOutlet private(set) weak var productPrice: UILabel!
    @IBOutlet private(set) weak var rateImage: UIImageView!
    @IBOutlet private(set) weak var rateNumber: UILabel!
    @IBOutlet private(set) weak var reviewsNumber: UILabel!
    @IBOutlet private(set) weak var moreButton: UIButton!
    
    // MARK: - Properties
    
    var featuredProduct: Any! {
        didSet {
            // update collection view components with data
            productName.text = featuredProduct  as? String
        }
    }
    
    // MARK: - initializer
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellStyle()
    }
    
    // MARK: - private handler
    
    private func setupCellStyle() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
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
