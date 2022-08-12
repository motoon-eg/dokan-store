//
//  SliderView.swift
//  Dokan
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit

class SliderView: UIView {

    // MARK: - Outlet

    @IBOutlet private(set) weak var sliderView: UIView!
    @IBOutlet private(set) weak var productSliderCollectionView: UICollectionView!

    // MARK: - Properties

    private var viewModel: [SliderCollectionViewCell.sliderViewModel]?

    // MARK: - initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        collectionViewSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)

        collectionViewSetup()
    }
}

// MARK: - CollectionView setup

extension SliderView {

    func collectionViewSetup() {
        Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)
        sliderView.fixInView(self)

        productSliderCollectionView.register(SliderCollectionViewCell.self)
        productSliderCollectionView.delegate = self
        productSliderCollectionView.dataSource = self
        collectionViewLayout()
    }

    func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        layout.itemSize = CGSize(width: (productSliderCollectionView.bounds.width) - 5, height: productSliderCollectionView.bounds.height)
        layout.minimumInteritemSpacing = 16
        layout.minimumLineSpacing = 16
        layout.scrollDirection = .horizontal
        productSliderCollectionView.collectionViewLayout = layout
    }
}

// MARK: - CollectionViewDelegate & Datasource

extension SliderView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SliderCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        guard let model = viewModel else { return UICollectionViewCell() }
        cell.configureCellData(viewModel: model[indexPath.row])
        return cell
    }
}


