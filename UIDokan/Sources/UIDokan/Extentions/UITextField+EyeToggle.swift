//
//  File.swift
//  
//
//  Created by marwa on 13/07/2022.
//

import Foundation
import UIKit


extension UITextField {
    
    func addPasswordToggle() {
        isSecureTextEntry = true
        rightViewMode = .unlessEditing
        rightView = createToggleButton()
        rightViewMode = .always
    }
    
    func createToggleButton() -> UIButton {
        let eyeButton = UIButton()
        eyeButton.setImage(.eyeIcone, for: .normal)
        
        if #available(iOS 15, *) {
            var buttonConfig = UIButton.Configuration.bordered()
            buttonConfig.baseBackgroundColor = .clear
            eyeButton.configuration = buttonConfig
        } else {
            eyeButton.imageEdgeInsets = Metrics.imageEdgeInsets
            eyeButton.frame = Metrics.buttonFrame
        }
        
        eyeButton.addTarget(self, action: #selector(didTapToggle), for: .touchUpInside)
        return eyeButton
    }
    
    @objc func didTapToggle(_ sender: UIButton) {
        isSecureTextEntry.toggle()
        let imageName = isSecureTextEntry ? UIImage.eyeIcone : UIImage.eyeSlashIcone
        sender.setImage((imageName), for: .normal)
    }
}

// MARK: - Constants
//
private extension UITextField {
    enum Metrics {
        static let imageEdgeInsets = UIEdgeInsets(top: 0, left: -24, bottom: 0, right: 16)
        static let buttonFrame = CGRect(x: 4, y: 4, width: 28, height: 28)
    }
}

private extension UIImage {
    static var eyeSlashIcone: UIImage {
        UIImage(systemName: "eye.slash")!
    }
    
    static var eyeIcone: UIImage {
        UIImage(systemName: "eye")!
    }
}
