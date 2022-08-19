//
//  ProductDetailsCoordinator.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 19/08/2022.
//

import UIKit

protocol ProductsCoordinator: AnyObject {}

class DefaultProductsCoordinator: Coordinator {
    var children: [Coordinator] = []
    let navigationController: UINavigationController

    init() {
        navigationController = UINavigationController()
    }

    func start() {
        showProductDetails()
    }

    private func showProductDetails() {
        let viewModel = ProductDetailsViewModel()
        let viewController = ProductDetailsViewController(viewModel: viewModel)
        show(viewController: viewController)
    }
}
