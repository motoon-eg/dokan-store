//
//  ProductDetailsViewController.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import UIDokan
import UIKit

class ProductDetailsViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private weak var InfoSellerView: InfoSellerView!
    @IBOutlet private weak var descriptionTextView: ReadMoreTextView!

    // MARK: Properties

    private let viewModel: ProductDetailsViewModelType
    private var navigationBarBehavior: ProductDetailsNavigationBarBehavior?

    // MARK: Init

    init(viewModel: ProductDetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        InfoSellerView.delegate = self
        configureDescriptionTextView()
        configureNavBar()
    }
}

// MARK: - Actions

extension ProductDetailsViewController {}

// MARK: - Configurations

private extension ProductDetailsViewController {

    func configureDescriptionTextView() {
        descriptionTextView.shouldTrim = true
        descriptionTextView.maximumNumberOfLines = 3
        descriptionTextView.attributedReadMoreText = NSAttributedString(string: "... Read more")
        descriptionTextView.attributedReadLessText = NSAttributedString(string: " Read less")
    }

    func configureNavBar() {
        title = "Product Detail"
        navigationBarBehavior = ProductDetailsNavigationBarBehavior(navigationItem: navigationItem)
        navigationBarBehavior?.configure(onRedo: {
            print("onRedo is tapped")
        }, onCart: {
            print("onCart is tapped")
        })
    }
}

// MARK: - Actions
//
private extension ProductDetailsViewController {
    
}

// MARK: - InfoSellerViewDelegate Protocol
extension ProductDetailsViewController: InfoSellerViewDelegate {
    func didInfoSellerViewTapped() {
        print("Info seller view is tapped")
    }
    
}
