//
//  ReusableView.swift
//
//  Created by heba isaa on 07/09/2021.
//

import UIKit
public protocol IdentifiableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension IdentifiableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

