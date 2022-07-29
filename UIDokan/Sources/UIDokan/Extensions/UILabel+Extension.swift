//
//  File.swift
//  
//
//  Created by Omar Ahmed on 21/07/2022.
//

import UIKit

public extension UILabel {
    
    func addTrailing(image: UIImage?, text:String) {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: -5, width: attachment.image?.size.width ?? 0.0, height: attachment.image?.size.height ?? 0.0)

        let attachmentString = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: text, attributes: [:])

        string.append(attachmentString)
        self.attributedText = string
    }
    
    func addLeading(image: UIImage?, text:String) {
        let attachment = NSTextAttachment()
        attachment.image = image
        attachment.bounds = CGRect(x: 0, y: -5, width: attachment.image?.size.width ?? 0.0, height: attachment.image?.size.height ?? 0.0)

        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)
        
        let string = NSMutableAttributedString(string: text, attributes: [:])
        mutableAttributedString.append(string)
        self.attributedText = mutableAttributedString
    }
}
