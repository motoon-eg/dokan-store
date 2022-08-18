//
//  CategoryListViewController.swift
//  Dokan
//
//  Created by heba isaa on 18/08/2022.
//

import UIKit

class CategoryListViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var categoriesCollectionview: UICollectionView!

    // MARK: Properties

    private let viewModel: CategoryListViewModelType

    // MARK: Init

    init(viewModel: CategoryListViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionview()
    }

    private func setupCollectionview() {
        categoriesCollectionview.register(CategoryListCell.self)
        categoriesCollectionview.delegate = self
        categoriesCollectionview.dataSource = self
    }
}

// MARK: - Actions

//
extension CategoryListViewController {}

// MARK: - Configurations

//
extension CategoryListViewController {}

// MARK: - Private Handlers

//
private extension CategoryListViewController {}

extension CategoryListViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryListCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (view.frame.width / 4) - 20, height: 200)
    }
}
