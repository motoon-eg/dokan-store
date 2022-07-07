//  
//  VerificationViewController.swift
//  Dokan
//
//  Created by Ahmed Nagy on 07/07/2022.
//

import UIKit

class VerificationViewController: UIViewController {
    
    // MARK: Outlets

    // MARK: Properties
        
    private let viewModel: VerificationViewModelType

    // MARK: Init
        
    init(viewModel: VerificationViewModelType) {
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
}

// MARK: - Actions
//
extension VerificationViewController {
    
}

// MARK: - Configurations
//
extension VerificationViewController {
    
}

// MARK: - Private Handlers
//
private extension VerificationViewController {
}
