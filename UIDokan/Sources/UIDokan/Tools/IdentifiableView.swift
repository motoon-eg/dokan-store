//
//  File.swift
//  
//
//  Created by heba isaa on 10/08/2022.
//

import Foundation
import UIKit

public protocol IdentifiableView: AnyObject {
    static var reuseIdentifier: String { get }
}

public extension IdentifiableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

