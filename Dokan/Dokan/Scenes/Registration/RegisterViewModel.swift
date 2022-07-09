//
//  RegisterViewModel.swift
//  Dokan
//
//  Created by heba isaa on 05/07/2022.
//

import Foundation

class RegisterViewModel {
    private var emailOrPhoneText: String = ""
    private var isButtonEnabled: (Bool) -> Void = { _ in }
}

extension RegisterViewModel: RegisterViewModelInput {
    func updatePhoneOrEmail(input: String) {
        emailOrPhoneText = input
        updateIsEnabledButton()
    }
}

// MARK: - RegisterViewModelOutput

extension RegisterViewModel: RegisterViewModelOutput {
    func ConfigureButtonEnabled(isEnabled: @escaping (Bool) -> Void) {
        self.isButtonEnabled = isEnabled
        updateIsEnabledButton()
    }
}

// MARK: - Private Handlers
//
private extension RegisterViewModel {
    func updateIsEnabledButton() {
        let isEmailValid = !emailOrPhoneText.isEmpty
        isButtonEnabled(isEmailValid)
    }
}
