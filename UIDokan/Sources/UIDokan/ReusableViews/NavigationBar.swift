//
//  File.swift
//  
//
//  Created by Omar Ahmed on 21/07/2022.
//

import UIKit

public extension UIViewController{
    
    func configureNavigationBar(headTitle: String,
                isfirstButtonHidden: Bool,
                isSecondButtonHidden: Bool,
                firstButtonName: String,
                secondButtonName: String,
                firstAction: Selector? = nil,
                secondAction: Selector? = nil) {
        
        let first = UIImage(named: firstButtonName)?.withRenderingMode(.alwaysOriginal)
        let second = UIImage(named: secondButtonName)?.withRenderingMode(.alwaysOriginal)
        
        let firstButton = UIBarButtonItem(image: first, style: .plain, target: self, action: firstAction)
        let secondButton = UIBarButtonItem(image: second, style: .plain, target: self, action: secondAction)
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        if !isfirstButtonHidden && !isSecondButtonHidden {
            navigationItem.rightBarButtonItems = [secondButton,firstButton]
        }else if isfirstButtonHidden {
            navigationItem.rightBarButtonItem = secondButton
        }else if isSecondButtonHidden {
            navigationItem.rightBarButtonItem = firstButton
        }
        
        title = headTitle
    }
}


