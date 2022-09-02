//
//  InfoSellerViewController.swift
//  Dokan
//
//  Created by ziad on 20/08/2022.
//

import UIDokan
import UIKit

class InfoSellerViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private weak var shopImage: UIImageView!
    @IBOutlet private weak var sortingButton: UIButton!
    @IBOutlet private weak var followButton: UIButton!
    @IBOutlet private weak var infoSellerCollectionView: UICollectionView!

    // MARK: Properties

    private var viewModel: InfoSellerViewModelType

    // MARK: Init

    init(viewModel: InfoSellerViewModelType) {
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
        style()
        registerSellerCollectionView()
        viewModel.loadSellerInfo()
        print(viewModel.numberOfCells)
        viewModel.onReloadData = {
            self.infoSellerCollectionView.reloadData()
        }
    }
}

// MARK: - Actions

//
extension InfoSellerViewController {}

// MARK: - Configurations

// MARK: - implement func to register collection view..

extension InfoSellerViewController {
    func registerSellerCollectionView() {
        let nib = UINib(nibName: "SellerInfoCell", bundle: nil)
        infoSellerCollectionView.register(nib, forCellWithReuseIdentifier: "SellerInfoCell")
        infoSellerCollectionView.delegate = self
        infoSellerCollectionView.dataSource = self
    }
}

extension InfoSellerViewController {

    private func style() {
        shopImage.layer.cornerRadius = 25
        sortingButton.applyButtonStyle(.border)
        followButton.applyButtonStyle(.filledBlue)
    }
}

// MARK: - Private Handlers

//
private extension InfoSellerViewController {}

extension InfoSellerViewController: UICollectionViewDelegate {}

extension InfoSellerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfCells
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let infoCell = collectionView.dequeueReusableCell(withReuseIdentifier: "SellerInfoCell", for: indexPath) as! SellerInfoCell
        return infoCell
    }
}

extension InfoSellerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: infoSellerCollectionView.frame.width / 2.5, height: 242)
    }
}
