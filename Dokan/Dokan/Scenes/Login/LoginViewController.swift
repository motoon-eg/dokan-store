//
//  LoginViewController.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 25/06/2022.
//

import UIKit

class LoginViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet private weak var emailTextField: UITextField!
    @IBOutlet private weak var passwordTextField: UITextField!
    @IBOutlet private weak var submitButton: UIButton!
    
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

        bindViewModel()
        bindTextFields()
    }
}

// MARK: - Actions
//
extension LoginViewController {

    @objc func didChangeEmailTextField(_ textField: UITextField) {
        viewModel.updateEmail(textField.text ?? "")
    }
    
    @objc func didChangePasswordTextField(_ textField: UITextField) {
        viewModel.updatePassword(textField.text ?? "")
    }
}

// MARK: Bind ViewModel
//
extension LoginViewController {
    
    func bindViewModel() {
        viewModel.configureOnButtonEnabled { [weak self] isEnabled in
            self?.submitButton.isEnabled = isEnabled
        }
    }
    
    func bindTextFields() {
        emailTextField.addTarget(self, action: #selector(didChangeEmailTextField(_:)), for: .editingChanged)
        passwordTextField.addTarget(self, action: #selector(didChangePasswordTextField(_:)), for: .editingChanged)
    }
}
