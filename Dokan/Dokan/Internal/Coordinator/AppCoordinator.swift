//
//  AppCoordinator.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 19/08/2022.
//

import UIKit

class AppCoordinator: Coordinator {
    var children: [Coordinator] = []
    let navigationController: UINavigationController
    let window: UIWindow
    private var onVerifyLogin: () -> Void = {}

    init(window: UIWindow, navigationController: UINavigationController) {
        self.window = window
        self.navigationController = navigationController
        onVerifyLogin = { [weak self] in
            self?.showHomeScreen()
        }
    }

    func start() {
        presentLoginCoordinator()
    }

    private func presentLoginCoordinator() {
        let coordinator = DefaultAuthenticationCoordinator { [weak self] in
            self?.children.removeAll()
            self?.onVerifyLogin()
        }

        children.append(coordinator)
        coordinator.start()
        replaceWindowRootViewController(coordinator.navigationController)
    }

    private func showHomeScreen() {
        let coordinator = DefaultProductsCoordinator()

        children.append(coordinator)
        coordinator.start()
        replaceWindowRootViewController(coordinator.navigationController)
    }
}

private extension AppCoordinator {

    func replaceWindowRootViewController(_ viewController: UIViewController) {
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: {
            self.window.rootViewController = viewController
            self.window.makeKeyAndVisible()
        }, completion: { _ in
            // maybe do something on completion here
        })
    }
}
