//
//  File.swift
//
//
//  Created by heba isaa on 10/08/2022.
//

import Foundation
import UIKit

extension UITableView {

    func register<T: UITableViewCell>(_ class: T.Type) where T: IdentifiableView {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)
        register(nib, forCellReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath) -> T where T: IdentifiableView {
        guard let cell = dequeueReusableCell(withIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}
