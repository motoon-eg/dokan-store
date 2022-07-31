//
//  TableViewDataSource.swift
//  Dokan
//
//  Created by heba isaa on 31/07/2022.
//

import Foundation
import UIKit
class CollectionViewDataSource: NSObject, UICollectionViewDataSource {

    var data = [String]()
    
    init(withData data: [String]) {
        self.data = data
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.data.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SliderCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)


        return cell
    }
}
