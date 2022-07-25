//
//  labelAndTextfield.swift
//  
//
//  Created by marwa on 21/07/2022.
//

import UIKit

public class LabelAndTextfield: UIView {
    
    @IBOutlet public var contentView: UIView!
    @IBOutlet weak var stackViewLabel: UILabel!
    @IBOutlet weak var stackViewTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        Bundle.main.loadNibNamed("LabelAndTextfield", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setupStyle()
    }
    
    private func setupStyle() {
        stackViewLabel.applyLabelStyle(.textFieldTitle)
        stackViewTextField.textFieldStyle()
    }
}
