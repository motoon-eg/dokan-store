//
//  SellerInfoCell.swift
//  Dokan
//
//  Created by raniazeid on 17/08/2022.
//

import UIKit

class SellerInfoCell: UICollectionViewCell {
   // MARK: - outlets..
    @IBOutlet weak private var sellerProductImage: UIImageView!
    @IBOutlet weak private var productName: UILabel!
    @IBOutlet weak private var productPrice: UILabel!
    @IBOutlet weak private var productReviewRate: UILabel!
    @IBOutlet weak private var productReviewerCount: UILabel!
    
    // MARK: - life cycle...
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    // MARK: - func to configure cell with data
    func configureCell(model : SellerInfoCellModel){
        self.sellerProductImage.setImage(with: model.sellerProductImage, placeholderImage: UIImage(named:""))
        self.productName.text  = model.productName
        self.productPrice.text = model.productPrice
        self.productReviewRate.text = model.productReviewRate
        self.productReviewerCount.text = model.productReviewerCount
    }
}
// MARK: - implement cell view model
extension SellerInfoCell{
    struct SellerInfoCellModel{
        var sellerProductImage : String
        var productName : String
        var productPrice: String
        var productReviewRate : String
        var productReviewerCount : String
    }
}
