//
//  ButtonsView.swift
//  Dokan
//
//  Created by Ahmed Nagy on 22/07/2022.
//

import UIKit

class ButtonsView: UIView {
    
    // Outlets
    @IBOutlet private var contentView: UIView!
    @IBOutlet private weak var addToFavoriteButton: LoadingButton!
    @IBOutlet private weak var addToCartButton: LoadingButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        InitiateButtonsView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        InitiateButtonsView()
    }
    
    private func InitiateButtonsView(){
        Bundle.main.loadNibNamed("ButtonsView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
