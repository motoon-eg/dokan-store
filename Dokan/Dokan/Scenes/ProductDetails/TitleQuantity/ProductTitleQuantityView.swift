//
//  ProductTitleQuantityView.swift
//  Dokan
//
//  Created by ziad on 21/07/2022.
//

import UIKit
class ProductTitleQuantityView: UIView {
    // MARK: Outlet
    
    @IBOutlet private(set) weak var productTitle: UILabel!
    @IBOutlet private(set) weak var productCurrency: UILabel!
    @IBOutlet private(set) weak var productPrice: UILabel!
    @IBOutlet private(set) weak var productReviewAverage: UILabel!
    @IBOutlet private(set) weak var productReviewCount: UILabel!
    @IBOutlet private(set) weak var productStockBackgroundView: UIView!
    @IBOutlet private(set) weak var productStockCount: UILabel!
    
    // MARK: Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        stylingProductDetails()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        stylingProductDetails()
    }
    
    // MARK: Style

    func stylingProductDetails() {
        self.productStockBackgroundView.layer.cornerRadius = 10
    }

    func changeStockBackGroundColor(stockCount: Int) {
        if stockCount > 10 {
            self.productStockBackgroundView.backgroundColor = .green
        } else if stockCount > 0 && stockCount <= 10 {
            self.productStockBackgroundView.backgroundColor = .orange
        } else {
            self.productStockBackgroundView.backgroundColor = .red
        }
    }

    // MARK: Configuration
    
    func passProductDetailsDataToView(productDetailsData: ProductDetails) {
    }
}

struct ProductDetails {
    var productTitle: String
    var productCurrency: String
    var productPrice: String
    var productReviewAverage: Double
    var productReviewCount: String
    var productStockCount: Int
}
