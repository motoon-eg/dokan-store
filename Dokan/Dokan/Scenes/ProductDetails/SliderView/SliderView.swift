//
//  SliderView.swift
//  Dokan
//
//  Created by heba isaa on 10/08/2022.
//

import UIDokan
import UIKit

class SliderView: UIView {

    // MARK: - Outlet

    @IBOutlet private(set) weak var sliderView: UIView!
    @IBOutlet private(set) weak var productSliderCollectionView: UICollectionView!

    // MARK: - Properties

    var viewModel: ProductDetailsViewModel?

    // MARK: - initializer

    override init(frame: CGRect) {
        super.init(frame: frame)

        collectionViewSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        collectionViewSetup()
    }

    func initViewModel() {

        viewModel?.onStateUpdate = { [weak self] () in
            guard let self = self else { return }

            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }

                switch self.viewModel?.productDetailsState {

                case .loading, .error, .empty:
                    self.startSkeletonView()
                case .populated:
                    self.stopSkeletonView()
                case .none:
                    self.stopSkeletonView()
                }
            }
        }

        viewModel?.reloadImageViewClosure = { [weak self] () in
            DispatchQueue.main.async { [weak self] in
                self?.productSliderCollectionView.reloadData()
            }
        }

        viewModel?.fetchProduct()
    }
}

// MARK: - CollectionView setup

extension SliderView {

    func collectionViewSetup() {
        Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)
        addAndFixSubview(sliderView)

        productSliderCollectionView.register(SliderCollectionViewCell.self)
        productSliderCollectionView.delegate = self
        productSliderCollectionView.dataSource = self
        collectionViewLayout()
        initViewModel()
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
        return viewModel?.numberOfCells ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SliderCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)

        let viewModel = viewModel?.getImageview(indexPath: indexPath)
        cell.sliderViewModel = viewModel
        return cell
    }
}
