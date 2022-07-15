//  
//  LoginViewController.swift
//  Dokan
//
//  Created by Omar Ahmed on 02/07/2022.
//

import UIKit

class LoginViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private(set) weak var emailTextField: UITextField!
    @IBOutlet private(set) weak var passwordTextField: UITextField!
    @IBOutlet private(set) weak var signInButton: UIButton!
    @IBOutlet private(set) weak var forgotPasswordButton: UIButton!
    @IBOutlet private(set) weak var signUpButton: UIButton!
    
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
        bindTextFields()
        bindSignInBtn()
        bindViewModel()
    }
}

// MARK: - Actions
//
extension LoginViewController {
    
}

// MARK: - Configurations
//
extension LoginViewController {
    
    func bindTextFields(){
        emailTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(textDidChange), for: .editingChanged)
    }
    
    func bindSignInBtn(){
        signInButton.addTarget(self, action: #selector(signInWasTapped), for: .touchUpInside)
    }
    
    func bindViewModel(){
        viewModel.configureOnButtonEnabled { [weak self] onEnabled in
            self?.signInButton.isEnabled = onEnabled
        }
    }
}

// MARK: - Private Handlers
//
private extension LoginViewController {
    
    @objc func textDidChange(_ sender: UITextField) {
        guard let text = sender.text else { return}
        
        if sender == emailTextField {
            viewModel.updateEmail(text)
        } else if sender == passwordTextField {
            viewModel.updatePassword(text)
        }
    }
    
    @objc func signInWasTapped(){}
}
