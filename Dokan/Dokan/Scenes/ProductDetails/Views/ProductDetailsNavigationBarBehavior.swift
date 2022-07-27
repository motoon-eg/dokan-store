//
//  Hi.swift
//  Dokan
//
//  Created by Omar Ahmed on 27/07/2022.
//

import UIKit


class ProductDetailsNavigationBarBehavior {
    private let navigationItem: UINavigationItem
    
    
    init(navigationItem: UINavigationItem) {
        self.navigationItem = navigationItem
    }
    
    func configureNavBar() {
        let redo = UIImage(named: "redo")?.withRenderingMode(.alwaysOriginal)
        let cart = UIImage(named: "shopping-cart-badge")?.withRenderingMode(.alwaysOriginal)
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: redo,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(redoWasTapped))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: cart,
                                                            style: .done,
                                                            target: self,
                                                            action: #selector(cartWasTapped))
    }
    
    @objc func redoWasTapped() {
        
    }
    
    @objc func cartWasTapped() {
        
    }
}
