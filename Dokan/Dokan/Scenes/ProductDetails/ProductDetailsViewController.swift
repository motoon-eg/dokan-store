//  
//  ProductDetailsViewController.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: Outlets

    @IBOutlet private weak var InfoSellerView: InfoSellerView!
    
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
        InfoSellerView.delegate = self
    }
}

// MARK: - Actions
//
extension ProductDetailsViewController {
    
}

// MARK: - Configurations
//
extension ProductDetailsViewController {
    
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
