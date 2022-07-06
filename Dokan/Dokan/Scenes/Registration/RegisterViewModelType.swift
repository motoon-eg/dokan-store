//
//  RegisterViewModelType.swift
//  Dokan
//
//  Created by heba isaa on 05/07/2022.
//

import Foundation

import Foundation

typealias RegisterViewModelType = RegisterViewModelInput & RegisterViewModelOutput

protocol RegisterViewModelInput {
    func updatePhoneOrEmail (input: String)
}
protocol RegisterViewModelOutput {
    func ConfigureButtonEnabled(isEnabled: @escaping (Bool) -> Void)
}
