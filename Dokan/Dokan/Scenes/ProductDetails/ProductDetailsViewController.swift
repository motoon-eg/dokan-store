//  
//  ProductDetailsViewController.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import UIKit
import UIDokan

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
    func configureNavBar(){
        configureNavigationBar(headTitle: "Product Details", isfirstButtonHidden: false, isSecondButtonHidden: false, firstButtonName: "redo", secondButtonName: "shopping-cart-badge", firstAction: #selector(redoWasTapped), secondAction: #selector(cartWasTapped))
    }
}

// MARK: - Private Handlers
//
private extension ProductDetailsViewController {
    @objc func redoWasTapped(){}
    
    @objc func cartWasTapped(){}
}
