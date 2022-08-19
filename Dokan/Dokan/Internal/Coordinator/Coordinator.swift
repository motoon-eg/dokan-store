//
//  Coordinator.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 19/08/2022.
//

import UIKit

/// A basic coordinator design pattern to help decouple things.
/// See: http://khanlou.com/2015/01/the-coordinator/
///
protocol Coordinator: AnyObject {
    var navigationController: UINavigationController { get }
    func start()
}

extension Coordinator {
    func show(viewController: UIViewController, animated: Bool = true) {
        navigationController.pushViewController(viewController, animated: animated)
    }

    func pop(animated: Bool = true) {
        navigationController.popViewController(animated: animated)
    }

    func popToRoot(animated: Bool = true) {
        navigationController.popToRootViewController(animated: animated)
    }

    func present(coordinator: Coordinator,
                 animated: Bool = true,
                 completion: @escaping () -> Void = {}) {
        navigationController.present(coordinator.navigationController,
                                     animated: animated,
                                     completion: completion)
    }

    func dismiss(animated: Bool = true,
                 completion: @escaping () -> Void = {}) {
        navigationController.dismiss(animated: animated,
                                     completion: completion)
    }
}
