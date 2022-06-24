//
//  File.swift
//  
//
//  Created by ziad on 23/06/2022.
//

import Foundation
import UIKit
extension UIView {
    
    static var nib: UINib {
        return UINib(nibName: self.className, bundle: nil)
    }
}

extension UITableView {
    
    func dequeueCell<T: UITableViewCell>() -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.className) as? T else { fatalError("DequeueReusableCell failed while casting") }
        return cell
    }
    
    func register<T: UITableViewCell>(cell: T.Type) {
        register(cell.nib, forCellReuseIdentifier: cell.className)
    }
}
extension UICollectionView {
    
    func dequeueCell<T: UICollectionViewCell>(for indexPath: IndexPath) -> T {
        
        guard let cell = self.dequeueReusableCell(withReuseIdentifier: T.className, for: indexPath) as? T else {
            fatalError("DequeueReusableCell failed while casting")
        }
        return cell
    }
    
    func register<T: UICollectionViewCell>(cell: T.Type) {
        register(cell.nib, forCellWithReuseIdentifier: cell.className)
    }
}

extension UICollectionView {
    
    class var cellId: String {
        return "\(self)"
    }
}
extension UITableViewCell {
    
    class var cellId: String {
        return "\(self)"
    }
}

extension NSObject {
    
    class var className: String {
        return "\(self)"
    }
}
