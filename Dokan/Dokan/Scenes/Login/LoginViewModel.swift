//  
//  LoginViewModel.swift
//  Dokan
//
//  Created by Omar Ahmed on 02/07/2022.
//

import Foundation

// MARK: LoginViewModel
//
class LoginViewModel {
    private var email: String = ""
    private var password: String = ""
    private var onButtonEnabled: (Bool) -> Void = { _ in }
   
}

// MARK: LoginViewModelInput

extension LoginViewModel: LoginViewModelInput {
    func updateEmail(_ text: String) {
        email = text
        updateEnabledStateButton()
    }
    
    func updatePassword(_ text: String) {
        password = text
        updateEnabledStateButton()
    }

}

// MARK: LoginViewModelOutput
//
extension LoginViewModel: LoginViewModelOutput {
   
    func configureOnButtonEnabled(onEnabled: @escaping (Bool) -> Void) {
        self.onButtonEnabled = onEnabled
        updateEnabledStateButton()
    }

}

// MARK: Private Handlers
//
private extension LoginViewModel {
    
    func updateEnabledStateButton() {
           let isEmailValid = !email.isEmpty
           let isPasswordValid = !password.isEmpty
           let isButtonEnabled = isEmailValid && isPasswordValid
           
           onButtonEnabled(isButtonEnabled)
       }
}
