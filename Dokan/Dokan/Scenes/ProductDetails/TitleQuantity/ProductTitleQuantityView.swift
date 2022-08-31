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

    // MARK: Properities

    lazy var productViewModel: ProductDetailsViewModel = .init()

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
        initViewModel()
    }

    func initView() {
        let model: tQViewModel = productViewModel.getproductViewModel()
        configureView(viewModel: model)
        changeStockBackGroundColor(stockCount: model.stockCount)
    }

    func initViewModel() {

        productViewModel.uploadLoadingState = { [weak self] () in
            guard let self = self else { return }

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }

                switch self.productViewModel.state {

                case .loading, .error, .empty:
                    self.startSkeletonView()
                case .populated:
                    self.stopSkeletonView()
                }
            }
        }

        productViewModel.reloadViewClosure = { [weak self] () in
            DispatchQueue.main.async { [weak self] in
                self?.initView()
            }
        }

        productViewModel.initFetchSingleProduct()
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

    func configureView(viewModel: tQViewModel) {
        productTitle.text = viewModel.title
        productCurrency.text = viewModel.currency
        productPrice.text = viewModel.price
        productReviewAverage.text = "\(viewModel.reviewAverage)"
        productReviewCount.text = "\(viewModel.reviewCount)"
        productStockCount.text = "\(viewModel.stockCount)"

        changeStockBackGroundColor(stockCount: viewModel.stockCount)
    }
}

public struct tQViewModel {
    let title: String
    let currency: String
    let price: String
    let reviewAverage: Double
    let reviewCount: Int
    let stockCount: Int
}
