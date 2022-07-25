//
//  TitleAndBodyLabels.swift
//  
//
//  Created by marwa on 25/07/2022.
//

import UIKit

class TitleAndBodyLabels: UIView {

    @IBOutlet public var contentView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    private func setup() {
        Bundle.main.loadNibNamed("TitleAndBodyLabels", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setupStyle()
    }
    
    private func setupStyle() {
        titleLabel.applyLabelStyle(.title)
        bodyLabel.applyLabelStyle(.body)
    }
}
