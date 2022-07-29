//  
//  ProductDetailsViewController.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {

    // MARK: Outlets
    
    @IBOutlet weak var productSliderCollectionView: UICollectionView!
    // MARK: Properties

    private let viewModel: ProductDetailsViewModelType
    private var sliderCollectionViewModel:SliderCollectionViewModel?
    
    // MARK: Init

    init(viewModel: ProductDetailsViewModelType) {
        self.viewModel = viewModel
        
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTable()
    }

    func setupTable() {
        productSliderCollectionView.register(SliderCollectionViewCell.self)

        productSliderCollectionView.delegate=self
        productSliderCollectionView.dataSource=self
    }
}

// MARK: - Actions
//
extension ProductDetailsViewController {

}

// MARK: - Configurations
//
extension ProductDetailsViewController {

}

// MARK: - Private Handlers
//
private extension ProductDetailsViewController {
}
// MARK: - UICollectionViewDatasource protocols

extension ProductDetailsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        5
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell: SliderCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
     sliderCollectionViewModel = SliderCollectionViewModel(productImage: UIImage(named: "")!, noOfPicture: 5, noOfCurrentPicture: indexPath.row)

        cell.configureCellData(SliderCollectionViewCellModel: sliderCollectionViewModel!)
        return cell

    }

}

// MARK: - UICollectionViewDelegateFlowLayout protocols

extension ProductDetailsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (productSliderCollectionView.bounds.width)-5, height: productSliderCollectionView.bounds.height)

    }
}
