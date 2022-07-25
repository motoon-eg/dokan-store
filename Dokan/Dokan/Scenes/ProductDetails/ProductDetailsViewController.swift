//  
//  ProductDetailsViewController.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak private var descriptionTextView: UITextView!
    
    @IBOutlet weak private var descriptionTextViewHeightConstraint: NSLayoutConstraint!
    
    
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
    }
    
    // MARK: - Actions
    //
    @IBAction func seeMoreButtonPressed(_ sender: UIButton) {
        
    }

}

// MARK: - Configurations
//
extension ProductDetailsViewController {

}

// MARK: - Private Handlers
//
private extension ProductDetailsViewController {
    
}
