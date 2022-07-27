//
//  FeaturedProductCollectionViewCell.swift
//  Dokan
//
//  Created by marwa on 26/07/2022.
//

import UIKit

class FeaturedProductCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet private(set) weak var productImage: UIImageView!
    @IBOutlet private(set) weak var productName: UILabel!
    @IBOutlet private(set) weak var productPrice: UILabel!
    @IBOutlet private(set) weak var rateImage: UIImageView!
    @IBOutlet private(set) weak var rateNumber: UILabel!
    @IBOutlet private(set) weak var reviewsNumber: UILabel!
    @IBOutlet private(set) weak var moreButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupCellStyle()
    }
    
    private func setupCellStyle() {
        self.layer.cornerRadius = 12
        self.layer.masksToBounds = true
    }
    
    var featuredProduct: Any! {
        didSet {
            // update collection view components with data
        }
    }
    
    @IBAction func moreButtonAction(_ sender: Any) {
        // navigate to more
    }
}
