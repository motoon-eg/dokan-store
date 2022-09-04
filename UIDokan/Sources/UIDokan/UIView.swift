//
//  UIView.swift
//  Dokan
//
//  Created by Clara Mounir Adly on 04/08/2022.
//

import Foundation
import UIKit

open class UIViewFromNib: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        commitInit()
    }

    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        commitInit()
    }

    private func commitInit() {
        let nibName = String(describing: Self.self)
        let budle = Bundle(for: Self.self)
        let nibFile = UINib(nibName: nibName, bundle: budle)
        guard let contentView = nibFile.instantiate(withOwner: Self.self).first as? UIView else {
            assertionFailure("unable to find the content view")
            return
        }
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(contentView)
    }
}
