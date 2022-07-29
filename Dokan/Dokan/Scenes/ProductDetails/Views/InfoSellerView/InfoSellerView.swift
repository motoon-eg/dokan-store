//
//  infoSellerView.swift
//  Dokan
//
//  Created by Omar Ahmed on 21/07/2022.
//

import UIKit
import UIDokan

class InfoSellerView: UIView {
    
    // MARK: Outlets
    
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var sellerImageView: UIImageView!
    @IBOutlet private weak var sellerNameLabel: UILabel!
    @IBOutlet private weak var sellerTypeLabel: UILabel!
    
    weak var delegate: InfoSellerViewDelegate?
        
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        addTapGestureRecognizer()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        addTapGestureRecognizer()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("InfoSellerView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        sellerType.addTrailing(image: UIImage(named: "verified"), text: sellerType.text ?? "" + " ")
    }
    
    private func addTapGestureRecognizer(){
        let tap = UITapGestureRecognizer(target: self, action: #selector(infoSellerViewWasTapped))
        addGestureRecognizer(tap)
    }
}


// MARK: - Actions

private extension InfoSellerView {
    @objc func infoSellerViewWasTapped(){
        delegate?.didInfoSellerViewTapped()
    }
}
