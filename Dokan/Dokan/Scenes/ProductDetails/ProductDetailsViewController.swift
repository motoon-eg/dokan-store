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
    var collectionViewDatasource: CollectionViewDataSource?
    var collectionViewDelegate: CollectionViewDelegate?
    private let viewModel: ProductDetailsViewModelType
    
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
    // MARK: - SetupCollectionview
    func setupTable() {
        productSliderCollectionView.register(SliderCollectionViewCell.self)
        
        self.collectionViewDelegate = CollectionViewDelegate(withDelegate: self)
        self.collectionViewDelegate = CollectionViewDelegate(size: CGSize(width: (productSliderCollectionView.bounds.width)-5, height: productSliderCollectionView.bounds.height))
        self.collectionViewDatasource = CollectionViewDataSource(withData: ["Item 1","Item 2","Item 3"])
        self.productSliderCollectionView.delegate = self.collectionViewDelegate
        self.productSliderCollectionView.dataSource = self.collectionViewDatasource
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
