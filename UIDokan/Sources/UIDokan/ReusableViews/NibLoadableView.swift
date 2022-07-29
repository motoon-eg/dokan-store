//
//  NibLoadableView.swift
//
//  Created by heba isaa on 07/09/2021.
//

import UIKit
public  protocol NibLoadableView: class {
    static var nibName: String { get }
}

public extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self)
    }
}
