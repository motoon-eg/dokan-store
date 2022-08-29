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
    private var categoriesviewModel: [CategoryCollectionViewCell.ViewModel]?

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
        configureSearchController()
    }
}

// MARK: - Actions

//
extension CategoryListViewController {}

// MARK: - Configurations

//
extension CategoryListViewController {
    func configureSearchController() {
        let searchController = UISearchController()
        searchController.searchResultsUpdater = self
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = "Search Product Name"
        navigationItem.searchController = searchController
        navigationItem.hidesSearchBarWhenScrolling = false
    }

    private func setupCollectionview() {
        categoriesCollectionview.register(CategoryCollectionViewCell.self)
        categoriesCollectionview.register(CategoryFooterReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CategoryFooterReusableView.identifier)
        categoriesCollectionview.delegate = self
        categoriesCollectionview.dataSource = self
    }
}

// MARK: - conform to UICollectionView protocols

extension CategoryListViewController: UICollectionViewDelegate {}

extension CategoryListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        categoriesviewModel?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CategoryCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        return cell
    }
}

extension CategoryListViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: (collectionView.bounds.width / 2) - 20, height: 280)
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
    let footer = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: CategoryFooterReusableView.identifier, for: indexPath) as! CategoryFooterReusableView
        footer.configure()
        return footer
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width * 0.8, height: 44)
    }
}

// MARK: - UISearchBarDelegate Methods

//

extension CategoryListViewController: UISearchResultsUpdating, UISearchBarDelegate {
    func updateSearchResults(for searchController: UISearchController) {
        #warning("update search results")
    }
}
