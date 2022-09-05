//
//  File.swift
//
//
//  Created by marwa on 18/08/2022.
//

import Foundation
import UIKit

public extension UIImageView {

    func applyCircleImageStyle() {
        layer.masksToBounds = true
        layer.cornerRadius = frame.height / 2
    }
}
