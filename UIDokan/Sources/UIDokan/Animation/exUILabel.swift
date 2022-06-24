//
//  File.swift
//  
//
//  Created by ziad on 23/06/2022.
//

import Foundation

import UIKit
extension UILabel {
  func addCharacterSpacing(kernValue: Double = 1.15) {
    guard let text = text, !text.isEmpty else { return }
    let string = NSMutableAttributedString(string: text)
    string.addAttribute(NSAttributedString.Key.kern, value: kernValue, range: NSRange(location: 0, length: string.length - 1))
    attributedText = string
  }
    // animatoion the label with transation
    enum Direction {
           case downwards(offset: CGFloat)
           case upwards(offset: CGFloat)
           case leftwards(offset: CGFloat)
           case rightwards(offset: CGFloat)
           
           func initialTransform() -> CGAffineTransform {
               switch self {
                   case .downwards(let offset):
                       return CGAffineTransform(translationX: 0, y: -offset)
                   case .upwards(let offset):
                       return CGAffineTransform(translationX: 0, y: offset)
                   case .leftwards(let offset):
                       return CGAffineTransform(translationX: offset, y: 0)
                   case .rightwards(let offset):
                       return CGAffineTransform(translationX: -offset, y: 0)
               }
           }
           func finalTransform() -> CGAffineTransform {
               switch self {
                   case .downwards(let offset):
                       return CGAffineTransform(translationX: 0, y: offset)
                   case .upwards(let offset):
                       return CGAffineTransform(translationX: 0, y: -offset)
                   case .leftwards(let offset):
                       return CGAffineTransform(translationX: -offset, y: 0)
                   case .rightwards(let offset):
                       return CGAffineTransform(translationX: offset, y: 0)
               }
           }
       }
    func animateTextChangeInto(newText: String, withDirection direction: Direction, ofDuration duration: Double, delay: Double) {
           let duplicatedLabel = duplicateViewWithConstraint()
           
           duplicatedLabel.text = newText
           
           duplicatedLabel.alpha = 0
           duplicatedLabel.transform = direction.initialTransform()
           
           UIView.animate(withDuration: duration,delay: delay) {
               duplicatedLabel.transform = .identity
               duplicatedLabel.alpha = 1
               self.transform = direction.finalTransform()
               self.alpha = 0
           } completion: { (_) in
               self.transform = .identity
               self.alpha = 1
               self.text = newText
               
               UIView.animate(withDuration: 0.2) {
                   duplicatedLabel.alpha = 0
                   duplicatedLabel.removeFromSuperview()
               }
           }
       }
       
       func duplicateViewWithConstraint() -> UILabel {
           let label = NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self)) as! UILabel
           superview?.addSubview(label)
           label.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
           label.topAnchor.constraint(equalTo: topAnchor).isActive = true
           label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
           label.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
           return label
       }
}
