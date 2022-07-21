//
//  infoSellerView.swift
//  Dokan
//
//  Created by Omar Ahmed on 21/07/2022.
//

import UIKit

class InfoSellerView: UIView {

    @IBOutlet weak var sellerImageProfile: UIImageView!
    
    @IBOutlet weak var sellerName: UILabel!
    
    @IBOutlet weak var sellerType: UILabel!
    
    @IBOutlet weak var sellerNavigationButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit(){
        let viewFromXib = Bundle.main.loadNibNamed("InfoSellerView", owner: self, options: nil)![0] as! UIView
        addSubview(viewFromXib)
        viewFromXib.frame = self.bounds
        viewFromXib.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        sellerType.addTrailing(image: UIImage(systemName: "cart")!, text: sellerType.text!)
    }
}

extension UILabel {
    
    func addTrailing(image: UIImage, text:String) {
        let attachment = NSTextAttachment()
        attachment.image = image

        let attachmentString = NSAttributedString(attachment: attachment)
        let string = NSMutableAttributedString(string: text, attributes: [:])

        string.append(attachmentString)
        self.attributedText = string
    }
    
    func addLeading(image: UIImage, text:String) {
        let attachment = NSTextAttachment()
        attachment.image = image

        let attachmentString = NSAttributedString(attachment: attachment)
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(attachmentString)
        
        let string = NSMutableAttributedString(string: text, attributes: [:])
        mutableAttributedString.append(string)
        self.attributedText = mutableAttributedString
    }
}
