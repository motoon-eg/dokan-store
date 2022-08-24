//
//  ProductTitleQuantityView.swift
//  Dokan
//
//  Created by ziad on 21/07/2022.
//

import UIKit

class ProductTitleQuantityView: UIView {
    // MARK: Outlet

    @IBOutlet private(set) weak var titleContentView: UIView!
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
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("ProductTitleQuantityView", owner: self, options: nil)
        addSubview(titleContentView)
        titleContentView.frame = bounds
        titleContentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]

        stylingProductDetails()
        let test = ViewModel(title: "Shoes", currency: "USD", price: "199", reviewAverage: 9.2, reviewCount: 34, stockCount: 5)
        configureView(viewModel: test)
        changeStockBackGroundColor(stockCount: test.stockCount)
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
