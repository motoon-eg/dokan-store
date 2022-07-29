//
//  CollectionHelper.swift
//  Rakwa
//
//  Created by heba isaa on 07/09/2021.
//

import Foundation
import UIKit

public extension UICollectionView {
 

    func register<T: UICollectionViewCell>(_: T.Type) where T: IdentifiableView{
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.reuseIdentifier, bundle: bundle)

        register(nib, forCellWithReuseIdentifier: T.reuseIdentifier)
    }

    func dequeueReusableCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T where T: IdentifiableView {
        guard let cell = dequeueReusableCell(withReuseIdentifier: T.reuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.reuseIdentifier)")
        }

        return cell
    }
}
