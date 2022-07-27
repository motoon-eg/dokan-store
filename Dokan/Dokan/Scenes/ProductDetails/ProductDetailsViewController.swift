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

    // MARK: Init
        
    init(viewModel: ProductDetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

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
        let navigationItem = navigationItem
        let navBar = ProductDetailsNavigationBarBehavior(navigationItem: navigationItem)
        
        navBar.configure(onRedo: {
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
