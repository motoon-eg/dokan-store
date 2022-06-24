//
//  File.swift
//  
//
//  Created by ziad on 23/06/2022.
//

import Foundation
import UIKit
extension UIView{
    // MARK: GRADIENT VIEW
    enum GradientDirection {
        case leftToRight
        case rightToLeft
        case topToBottom
        case bottomToTop
    }
    func gradientBackground(from color1: UIColor, to color2: UIColor, direction: GradientDirection) {
        let gradient = CAGradientLayer()
        gradient.frame = self.bounds
        gradient.colors = [color1.cgColor, color2.cgColor]
        
        switch direction {
        case .leftToRight:
            gradient.startPoint = CGPoint(x: 0.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 1.0, y: 0.5)
        case .rightToLeft:
            gradient.startPoint = CGPoint(x: 1.0, y: 0.5)
            gradient.endPoint = CGPoint(x: 0.0, y: 0.5)
        case .bottomToTop:
            gradient.startPoint = CGPoint(x: 0.5, y: 1.0)
            gradient.endPoint = CGPoint(x: 0.5, y: 0.0)
        default:
            gradient.locations = [0.3, 1.0]
        }
        self.layer.insertSublayer(gradient, at: 0)
    }
}

extension UITextField{
    //=====padding==================
    
    func setPadding(mount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: mount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        self.rightView = paddingView
        self.rightViewMode = .always

    }
   
    
    //========shadowLine===========

    func setBottomLine(txtBackground : UIColor ,bottomColor : UIColor) {
        
        self.borderStyle = .none
        self.layer.backgroundColor = txtBackground.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = bottomColor.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
}
