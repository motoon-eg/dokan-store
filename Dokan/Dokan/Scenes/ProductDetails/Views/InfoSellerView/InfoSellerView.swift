//
//  infoSellerView.swift
//  Dokan
//
//  Created by Omar Ahmed on 21/07/2022.
//

import UIKit
import UIDokan

class InfoSellerView: UIView {
    
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var sellerImageProfile: UIImageView!
    
    @IBOutlet weak var sellerName: UILabel!
    
    @IBOutlet weak var sellerType: UILabel!
    
    @IBOutlet weak var sellerNavigationButton: UIButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("InfoSellerView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        sellerType.addTrailing(image: UIImage(named: "verified")!, text: sellerType.text! + " ")
    }
}
