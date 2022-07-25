//
//  File.swift
//  
//
//  Created by Omar Ahmed on 21/07/2022.
//

import UIKit

public extension UIViewController{
    
    func configureNavigationBar(headTitle: String,
                isLeftButtonHidden: Bool,
                isRightButtonHidden: Bool,
                leftImageNamed: String,
                rightImageNamed: String,
                LeftButtonAction: Selector? = nil,
                rightButtonAction: Selector? = nil) {
        
        let first = UIImage(named: leftImageNamed)?.withRenderingMode(.alwaysOriginal)
        let second = UIImage(named: rightImageNamed)?.withRenderingMode(.alwaysOriginal)
        
        let firstButton = UIBarButtonItem(image: first, style: .plain, target: self, action: LeftButtonAction)
        let secondButton = UIBarButtonItem(image: second, style: .plain, target: self, action: rightButtonAction)
        let backButton = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        
        navigationController?.navigationBar.topItem?.backBarButtonItem = backButton
        
        if !isLeftButtonHidden && !isRightButtonHidden {
            navigationItem.rightBarButtonItems = [secondButton,firstButton]
        }else if isLeftButtonHidden {
            navigationItem.rightBarButtonItem = secondButton
        }else if isRightButtonHidden {
            navigationItem.rightBarButtonItem = firstButton
        }
        
        title = headTitle
    }
}


