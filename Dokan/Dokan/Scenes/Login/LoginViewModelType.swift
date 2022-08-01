//
//  LoginViewModelType.swift
//  Dokan
//
//  Created by Omar Ahmed on 02/07/2022.
//

import Foundation

/// Login Input & Output
///
typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput

/// Login ViewModel Input
///
protocol LoginViewModelInput {
    func updateEmail(_ text: String)
    func updatePassword(_ text: String)
}

/// Login ViewModel Output
///
protocol LoginViewModelOutput {
    func configureOnButtonEnabled(onEnabled: @escaping (Bool) -> Void)
}
