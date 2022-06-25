//
//  LoginViewModelType.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 25/06/2022.
//

import Foundation

protocol LoginViewModelInput {
    func updateEmail(_ text: String)
    func updatePassword(_ text: String)
}

protocol LoginViewModelOutput {
    func configureOnButtonEnabled(onEnabled: @escaping (Bool) -> Void)
}

typealias LoginViewModelType = LoginViewModelInput & LoginViewModelOutput
