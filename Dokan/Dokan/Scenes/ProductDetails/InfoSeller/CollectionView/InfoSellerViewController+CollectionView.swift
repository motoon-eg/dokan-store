//
//  InfoSellerViewController+CollectionView.swift
//  Dokan
//
//  Created by ziad on 02/09/2022.
//

import UIKit

// MARK: Regsteration

//
extension InfoSellerViewController {

    func registerSellerCollectionView() {
        let nib = UINib(nibName: "SellerInfoCell", bundle: nil)
        infoSellerCollectionView.register(nib, forCellWithReuseIdentifier: "SellerInfoCell")
        infoSellerCollectionView.delegate = self
        infoSellerCollectionView.dataSource = self
    }
}

// MARK: - CollectionView

//
extension InfoSellerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SellerInfoCell", for: indexPath) as! SellerInfoCell
        let infoSellerCellData = viewModel.getInfoSellerProducts(at: indexPath)
        infoCell.configureCell(model: infoSellerCellData)
        return infoCell
    }
}

extension InfoSellerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: infoSellerCollectionView.frame.width / 2.5, height: 242)
    }
}
