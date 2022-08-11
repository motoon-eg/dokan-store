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
    
    @IBOutlet private weak var buttonsView: ButtonsView!
    @IBOutlet private weak var InfoSellerView: InfoSellerView!
    @IBOutlet private weak var descriptionTextView: ReadMoreTextView!

    // MARK: Properties
    
    private let viewModel: ProductDetailsViewModelType
    private var addedToCart = false
    private var addedToFavorite = false
    
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
        configureButtonsView()
    }
}

// MARK: - Actions

extension ProductDetailsViewController {}

// MARK: - Configurations
//
private extension ProductDetailsViewController {
    
    func configureButtonsView() {
        buttonsView.addToCartButton.addTarget(self, action: #selector(addToCartButtonTapped), for: .touchUpInside)
        buttonsView.addToFavoriteButton.addTarget(self, action: #selector(addToFavoriteButtonTapped), for: .touchUpInside)
    }
    
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
    @objc func addToCartButtonTapped() {
        buttonsView.addToCartButton.addButtontoCartTapped {
            #warning("Implement tapping the add to cart button")
        }
    }
    
    @objc func addToFavoriteButtonTapped() {
        
        buttonsView.addToFavoriteButton.addButtontoCartTapped {
            #warning("Implement tapping the add to favorite button")
        }
    }
}

// MARK: - InfoSellerViewDelegate Protocol

extension ProductDetailsViewController: InfoSellerViewDelegate {
    func didInfoSellerViewTapped() {
        print("Info seller view is tapped")
    }
}
