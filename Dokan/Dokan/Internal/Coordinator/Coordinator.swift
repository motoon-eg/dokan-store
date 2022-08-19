//
//  Coordinator.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 19/08/2022.
//

import UIKit

protocol Coordinator: AnyObject {
    var children: [Coordinator] { get set }
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

    func present(coordinator: Coordinator, animated: Bool = true, completion: @escaping () -> Void = {}) {
        children.append(coordinator)
        navigationController.present(coordinator.navigationController, animated: animated, completion: completion)
    }

    func dismiss(coordinator: Coordinator, animated: Bool = true, completion: @escaping () -> Void = {}) {
        children.removeAll(where: { $0 === coordinator })
        navigationController.dismiss(animated: animated, completion: completion)
    }
}
