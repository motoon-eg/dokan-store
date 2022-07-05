//
//  RegisterViewModel.swift
//  Dokan
//
//  Created by heba isaa on 05/07/2022.
//

import Foundation

class RegisterViewModel{
    
    private var emailOrPhoneTxt: String = ""
    private var isButtonEnabled:(Bool) -> Void = {_ in}
    
}

extension RegisterViewModel:RegisterViewModelInput{
    
    func updatePhoneOrEmail(input: String) {
        emailOrPhoneTxt=input
        updateIsEnabledButton()
    }
    
}

extension RegisterViewModel:RegisterViewModelOutput{
    
func ConfigureButtonEnabled(isEnabled: @escaping (Bool) -> Void) {
    self.isButtonEnabled = isEnabled
    updateIsEnabledButton()
}

}

extension RegisterViewModel{
    
    func updateIsEnabledButton(){
        let isEmailValid = !emailOrPhoneTxt.isEmpty
        isButtonEnabled(isEmailValid)
    }
}
