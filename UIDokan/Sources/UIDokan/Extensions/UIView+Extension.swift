//
//  File.swift
//
//
//  Created by heba isaa on 12/08/2022.
//

import Foundation
import UIKit

public extension UIView {

    func fixInView(_ container: UIView) {
        container.addSubview(self)
        translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            leadingAnchor.constraint(equalTo: container.leadingAnchor),
            trailingAnchor.constraint(equalTo: container.trailingAnchor),
            topAnchor.constraint(equalTo: container.topAnchor),
            bottomAnchor.constraint(equalTo: container.bottomAnchor),
        ])
    }
}
