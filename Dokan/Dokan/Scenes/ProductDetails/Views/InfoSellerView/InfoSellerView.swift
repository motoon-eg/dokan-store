//
//  infoSellerView.swift
//  Dokan
//
//  Created by Omar Ahmed on 21/07/2022.
//

import UIKit
import UIDokan

class InfoSellerView: UIView {
    
    // MARK: - Outlets
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var sellerImageProfile: UIImageView!
    @IBOutlet private weak var sellerName: UILabel!
    @IBOutlet private weak var sellerType: UILabel!
    @IBOutlet private weak var sellerNavigationButton: UIButton!
    
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
