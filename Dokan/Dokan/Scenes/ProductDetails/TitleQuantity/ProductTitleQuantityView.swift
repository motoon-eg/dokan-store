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
        productStockBackgroundView.layer.cornerRadius = 10
    }

    private func changeStockBackGroundColor(stockCount: Int) {
        let color: UIColor
        if stockCount > 10 {
            color = .green
        } else if stockCount > 0 {
            color = .orange
        } else {
            color = .red
        }

        productStockBackgroundView.backgroundColor = color
    }

    // MARK: Configuration

    func configureView(viewModel: ViewModel) {
        productTitle.text = viewModel.title
        productCurrency.text = viewModel.currency
        productPrice.text = viewModel.price
        productReviewAverage.text = "\(viewModel.reviewAverage)"
        productReviewCount.text = "\(viewModel.reviewCount)"
        productStockCount.text = "\(viewModel.stockCount)"

        changeStockBackGroundColor(stockCount: viewModel.stockCount)
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
