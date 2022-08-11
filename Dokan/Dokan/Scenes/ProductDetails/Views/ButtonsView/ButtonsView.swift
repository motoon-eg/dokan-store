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
    @IBOutlet weak var addToFavoriteButton: LoadingButton!
    @IBOutlet weak var addToCartButton: LoadingButton!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initiateButtonsView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initiateButtonsView()
    }
    
    private func initiateButtonsView(){
        Bundle.main.loadNibNamed("ButtonsView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}
