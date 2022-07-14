//
//  File.swift
//  
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit


let button = UIButton()
let eyeButton = UIButton()

extension UITextField {
    
    func eye(){
        isSecureTextEntry = true
        rightViewMode = .unlessEditing
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -24, bottom: 0, right: 15)
        button.frame = CGRect(x: CGFloat(frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(40))
        button.addTarget(self, action: #selector(didTapToggle2), for: .touchUpInside)
        rightView = button
        rightViewMode = .always
        
    }
    @objc func didTapToggle2(){
        isSecureTextEntry = !isSecureTextEntry
        guard isSecureTextEntry else {
            button.setImage(UIImage(systemName: "eye.slash"), for: .normal)
            isSecureTextEntry = false
            return
        }
        button.setImage(UIImage(systemName: "eye"), for: .normal)
        isSecureTextEntry = true
        
    }
    
// --------------------------------------------------------------------
    
    
//    func addEyeToggle() {
//        isSecureTextEntry = true
//        rightViewMode = .unlessEditing
//        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
//        
//        if #available(iOS 15, *) {
//            var buttonConfig = UIButton.Configuration.bordered()
//            buttonConfig.baseBackgroundColor = .clear
//            eyeButton.configuration = buttonConfig
//            print("done")
//        } else {
//            eyeButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -24, bottom: 0, right: 15)
//            eyeButton.frame = CGRect(x: CGFloat(frame.size.width - 25), y: CGFloat(5), width: CGFloat(20), height: CGFloat(40))
//        }
//            
//        eyeButton.addTarget(self, action: #selector(didTapToggle), for: .touchUpInside)
//        
//        rightView = eyeButton
//        rightViewMode = .always
//    }
//    
//    @objc func didTapToggle(){
//        isSecureTextEntry = !isSecureTextEntry
//        guard isSecureTextEntry else {
//            eyeButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
//            isSecureTextEntry = false
//            return
//        }
//        eyeButton.setImage(UIImage(systemName: "eye"), for: .normal)
//        isSecureTextEntry = true
//             
//    }
//    
}
