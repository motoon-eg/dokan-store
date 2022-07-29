//  
//  ProductDetailsViewController.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: Outlets

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
        configureNavBar()
    }
}

// MARK: - Actions
//
extension ProductDetailsViewController {
    
}

// MARK: - Configurations
//
extension ProductDetailsViewController {
    
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

// MARK: - Private Handlers
//
private extension ProductDetailsViewController {
}
