//
//  UIView.swift
//  Dokan
//
//  Created by Clara Mounir Adly on 04/08/2022.
//

import Foundation
import UIKit

open class UIViewFromNib: UIView {

    override public init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }

    private func commitInit() {
        let nibName = String(describing: Self.self)
        guard let contentView = nibFile.instantiate(withOwner: Self.self).first as? UIView else {
        let bundle = Bundle(for: Self.self)
        let nibFile = UINib(nibName: nibName, bundle: bundle)
            assertionFailure("unable to find the content view")
            return
        }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }
}
