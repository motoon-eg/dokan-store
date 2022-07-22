//
//  File.swift
//  
//
//  Created by Omar Ahmed on 21/07/2022.
//

import UIKit

extension UIViewController{
    var badge: UIView {
        return UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 4))
    }

    func config(headTitle: String,isfirstButtonHidden: Bool,isCartButtonHidden: Bool,firstButtonName: String,cartButtonName: String = "cart",action: Selector){
        let shareButton = UIBarButtonItem(image: UIImage(systemName: firstButtonName), style: .plain, target: self, action: action)
        let cartButton = UIBarButtonItem()
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        badge.translatesAutoresizingMaskIntoConstraints = false
        badge.layer.cornerRadius = 4
        badge.layer.masksToBounds = true
        badge.backgroundColor = .red
        let btnName = UIButton()
        btnName.setImage(UIImage(systemName: cartButtonName), for: .normal)
        btnName.frame = CGRect(x: 0, y: 0, width: 30, height: 55)
        btnName.addSubview(badge)
        btnName.contentHorizontalAlignment = .center
        
        NSLayoutConstraint.activate([
            badge.leftAnchor.constraint(equalTo: btnName.leftAnchor, constant: 18),
            badge.topAnchor.constraint(equalTo: btnName.topAnchor, constant: 12),
            badge.widthAnchor.constraint(equalToConstant: 10),
            badge.heightAnchor.constraint(equalToConstant: 10),
            
            btnName.widthAnchor.constraint(equalToConstant: 30),
            btnName.heightAnchor.constraint(equalToConstant: 55),
        ])
        
        cartButton.customView = btnName
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        if !isfirstButtonHidden && !isCartButtonHidden {
            navigationItem.rightBarButtonItems = [cartButton,shareButton]
        }else if isfirstButtonHidden {
            navigationItem.rightBarButtonItem = cartButton
        }else if isCartButtonHidden {
            navigationItem.rightBarButtonItem = shareButton
        }
        
        title = "Road"
    }
}


