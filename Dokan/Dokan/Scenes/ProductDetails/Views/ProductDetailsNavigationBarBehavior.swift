//
//  Hi.swift
//  Dokan
//
//  Created by Omar Ahmed on 27/07/2022.
//

import UIKit


class ProductDetailsNavigationBarBehavior {
    private unowned var navigationItem: UINavigationItem
    private var onRedo: () -> () = {}
    private var onCart: () -> () = {}
    private var navigationItems: [UIBarButtonItem] = []
    
    init(navigationItem: UINavigationItem) {
        self.navigationItem = navigationItem
    }
    
    func configure(onRedo: @escaping () -> () ,onCart: @escaping () -> ()) {
        self.onRedo = onRedo
        self.onCart = onCart
        
        let redoButton = UIBarButtonItem(image: UIImage(named: "redo")?.withRenderingMode(.alwaysOriginal),
                                     style: .done,
                                     target: self,
                                     action: #selector(redoWasTapped))
        let cartButton = UIBarButtonItem(image: UIImage(named: "shopping-cart")?.withRenderingMode(.alwaysOriginal),
                                         style: .done,
                                         target: self,
                                         action: #selector(cartWasTapped))
        navigationItems = [cartButton,redoButton]
        navigationItem.rightBarButtonItems = navigationItems
    }
    
    func updateCartButton() {
        let cartButton = UIBarButtonItem(image: UIImage(named: "shopping-cart-badge")?.withRenderingMode(.alwaysOriginal),
                                         style: .done,
                                         target: self,
                                         action: #selector(cartWasTapped))
        navigationItems[0] = cartButton
        navigationItem.rightBarButtonItems = navigationItems
    }
    
    @objc private func redoWasTapped() {
        onRedo()
    }
    
    @objc private func cartWasTapped() {
        onCart()
    }
}
