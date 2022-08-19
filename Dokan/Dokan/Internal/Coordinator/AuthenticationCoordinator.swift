//
//  AuthenticationCoordinator.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 19/08/2022.
//

import UIKit

// MARK: - AuthenticationCoordinator

protocol AuthenticationCoordinator: AnyObject {
    func showRegistration()
    func showVerification()
    func didVerifyPhoneNumber()
}

// MARK: - DefaultAuthenticationCoordinator

class DefaultAuthenticationCoordinator: Coordinator {
    var children: [Coordinator] = []
    let navigationController: UINavigationController
    private let onVerifyLogin: () -> Void

    init(onVerifyLogin: @escaping () -> Void) {
        self.onVerifyLogin = onVerifyLogin
        navigationController = UINavigationController()
    }

    func start() {
        let viewModel = LoginViewModel()
        let viewController = LoginViewController(viewModel: viewModel)
        viewController.coordinator = self
        show(viewController: viewController)
    }
}

extension DefaultAuthenticationCoordinator: AuthenticationCoordinator {

    func showRegistration() {
        let viewModel = RegisterViewModel()
        let viewController = RegisterViewController(viewModel: viewModel)
        viewController.coordinator = self
        show(viewController: viewController)
    }

    func showVerification() {
        let viewModel = VerificationViewModel()
        let viewController = VerificationViewController(viewModel: viewModel)
        viewController.coordinator = self
        show(viewController: viewController)
    }

    func didVerifyPhoneNumber() {
        onVerifyLogin()
    }
}
