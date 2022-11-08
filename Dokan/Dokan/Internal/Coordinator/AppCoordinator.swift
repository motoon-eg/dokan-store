//
//  AppCoordinator.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 19/08/2022.
//

import UIKit

class AppCoordinator: Coordinator {
    let navigationController: UINavigationController
    let window: UIWindow
    private var onVerifyLogin: () -> Void = {}
    private var children: [Coordinator] = []

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
}

// MARK: Flows!

extension AppCoordinator {

    private func presentLoginCoordinator() {
        let coordinator = DefaultAuthenticationCoordinator { [weak self] in
            self?.children.removeAll()
            self?.onVerifyLogin()
        }

        startCoordinator(coordinator)
        replaceWindowRootViewController(coordinator.navigationController)
    }

    private func showHomeScreen() {
        let coordinator = DefaultProductsCoordinator()

        startCoordinator(coordinator)
        replaceWindowRootViewController(coordinator.navigationController)
    }
}

// MARK: Private Helpers

private extension AppCoordinator {

    private func startCoordinator(_ coordinator: Coordinator) {
        children = [coordinator]
        coordinator.start()
    }
}

// MARK: Window Helpers

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
