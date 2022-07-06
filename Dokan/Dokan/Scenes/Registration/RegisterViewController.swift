//
//  RegisterViewController.swift
//  Dokan
//
//  Created by heba isaa on 05/07/2022.
//

import UIKit

class RegisterViewController: UIViewController {
    @IBOutlet weak var signInBtn: UIButton!
    @IBOutlet weak var email_phoneText: UITextField!
    @IBOutlet weak var continueBtn: UIButton!
        private let viewModel: RegisterViewModelType
    override func viewDidLoad() {

        super.viewDidLoad()
        bindEmail_phoneTxt()
        bindContinueButton()
        bindViewModel()
        bindSigninButton()
    }
    init(model: RegisterViewModelType) {
        self.viewModel = model
        super.init(nibName: nil, bundle: nil)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    }

extension RegisterViewController {
        func bindEmail_phoneTxt() {
        email_phoneText.addTarget(self, action: #selector(txtFieldTap), for: .editingChanged)
    }
    func bindContinueButton() {
        continueBtn.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }
    func bindSigninButton() {
        signInBtn.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
    }
    func bindViewModel() {
        viewModel.ConfigureButtonEnabled { [weak self] onEnabled in
            self?.continueBtn.isEnabled = onEnabled
        }
    }
}

extension RegisterViewController {
        @objc  func txtFieldTap(_ senser: UITextField) {
        viewModel.updatePhoneOrEmail(input: senser.text ?? "")
    }
    @objc  func buttonTap(_ senser: UIButton) {
        if senser == signInBtn {
            // navigate to signin screen
        }else {
            guard let email = email_phoneText.text else {return}
            // navigate to verification screen
        }
            }
}
