//
//  LoginViewModel.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 25/06/2022.
//

import Foundation

// View      -- (Action) --> ViewModel
// ViewModel -- (Update) --> View

// MARK: LoginViewModel
//
class LoginViewModel {
    private var emailText: String = ""
    private var passwordText: String = ""
    private var onButtonEnabled: (Bool) -> Void = { _ in }
}

// MARK: LoginViewModelInput
//
extension LoginViewModel: LoginViewModelInput {
    
    func updateEmail(_ text: String) {
        emailText = text
//        updateEnabledState()
    }
    
    func updatePassword(_ text: String) {
        passwordText = text
        updateEnabledState()
    }
}

// MARK: LoginViewModelOutput
//
extension LoginViewModel: LoginViewModelOutput {
    
    func configureOnButtonEnabled(onEnabled: @escaping (Bool) -> Void) {
        self.onButtonEnabled = onEnabled
        updateEnabledState()
    }
}

// MARK: Private Handlers
//
extension LoginViewModel {
  
    func updateEnabledState() {
        let isEmailValid = !emailText.isEmpty
        let isPasswordValid = !passwordText.isEmpty
        let isButtonEnabled = isEmailValid && isPasswordValid
        
        onButtonEnabled(isButtonEnabled)
    }
}
