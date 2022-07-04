//  
//  LoginViewController.swift
//  Dokan
//
//  Created by Omar Ahmed on 02/07/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var forgotPasswordBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    // MARK: Properties
        
    private let viewModel: LoginViewModelType

    // MARK: Init
        
    init(viewModel: LoginViewModelType) {
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
extension LoginViewController {
    
}

// MARK: - Configurations
//
extension LoginViewController {
    
}

// MARK: - Private Handlers
//
private extension LoginViewController {
}
