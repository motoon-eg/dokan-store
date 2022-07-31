//
//  TableViewDelegate.swift
//  Dokan
//
//  Created by heba isaa on 31/07/2022.
//

import Foundation
import UIKit

class CollectionViewDelegate: NSObject, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    // MARK: - Properties
    
    weak var delegate: NSObject?

    var height = 0.0
    var width = 0.0
    init(withDelegate delegate: NSObject) {
        self.delegate = delegate
    }
    // MARK: - UIcollectionviewDelegateFlowLayout
    init(size: CGSize) {
        height = size.height
        width = size.width
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (width)-5, height: height)

    }

}
