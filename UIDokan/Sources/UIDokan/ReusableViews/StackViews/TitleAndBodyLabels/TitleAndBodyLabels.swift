//
//  TitleAndBodyLabels.swift
//
//
//  Created by marwa on 25/07/2022.
//

import UIKit

class TitleAndBodyLabels: UIView {

    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bodyLabel: UILabel!

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
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        setupStyle()
    }

    private func setupStyle() {
        titleLabel.applyLabelStyle(.title)
        bodyLabel.applyLabelStyle(.body)
    }
}
