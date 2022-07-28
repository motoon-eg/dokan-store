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

    private func stylingProductDetails() {
        self.productStockBackgroundView.layer.cornerRadius = 10
    }

    func changeStockBackGroundColor(stockCount: Int) {
        
        let color: UIColor
        
        if stockCount > 10 {
            color = .green
        } else if stockCount > 0 {
            color = .orange
        } else {
            color = .red
        }
        
        self.productStockBackgroundView.backgroundColor = color
        
    }

    // MARK: Configuration
    
    func configureView(viewModel: ViewModel) {
        self.productTitle.text = viewModel.title
        self.productCurrency.text = viewModel.currency
        self.productPrice.text = viewModel.price
        self.productReviewAverage.text = "\(viewModel.reviewAverage)"
        self.productReviewCount.text = "\(viewModel.reviewCount)"
        self.productStockCount.text = "\(viewModel.stockCount)"
    }
}

extension ProductTitleQuantityView {
    struct ViewModel {
        let title: String
        let currency: String
        let price: String
        let reviewAverage: Double
        let reviewCount: Int
        let stockCount: Int
    }
}
