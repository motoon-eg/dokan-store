//
//  RegisterViewController.swift
//  Dokan
//
//  Created by heba isaa on 05/07/2022.
//

import UIKit

class RegisterViewController: UIViewController {

    // MARK: - Outlets

    @IBOutlet private weak var signInButton: UIButton!
    @IBOutlet private weak var email_phoneTextField: UITextField!
    @IBOutlet private weak var continueButton: UIButton!

    // MARK: - Properties

    private let viewModel: RegisterViewModelType

    init(model: RegisterViewModelType) {
        self.viewModel = model
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: - Life Cycle

    override func viewDidLoad() {

        super.viewDidLoad()
        bindEmailOrphoneText()
        bindContinueButton()
        bindViewModel()
        bindSigninButton()
    }
}

extension RegisterViewController {

    func bindEmailOrphoneText() {
        email_phoneTextField.addTarget(self, action: #selector(emailOrPhoneTextChanged), for: .editingChanged)
    }

    func bindContinueButton() {
        continueButton.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }

    func bindSigninButton() {
        signInButton.addTarget(self, action: #selector(buttonWasTapped), for: .touchUpInside)
    }

    func bindViewModel() {
        viewModel.ConfigureButtonEnabled { [weak self] onEnabled in
            self?.continueButton.isEnabled = onEnabled
        }
    }
}

extension RegisterViewController {

    @objc  func emailOrPhoneTextChanged(_ sender: UITextField) {
        viewModel.updatePhoneOrEmail(input: sender.text ?? "")
    }

    @objc  func buttonWasTapped(_ sender: UIButton) {
        switch sender {
        case signInButton :
            print("")
            // navigate to signin screen
        default:
            guard let email = email_phoneTextField.text else { return }
            // navigate to verification screen

        }
    }
}
