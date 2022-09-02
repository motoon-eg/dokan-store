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
    @IBOutlet weak var infoSellerCollectionView: UICollectionView!

    // MARK: Properties

    var viewModel: InfoSellerViewModelType

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
        callInfoSellerApi()
    }
}

// MARK: - Actions

//
extension InfoSellerViewController {}

// MARK: - Configurations

extension InfoSellerViewController {

    private func style() {
        shopImage.layer.cornerRadius = 25
        sortingButton.applyButtonStyle(.border)
        followButton.applyButtonStyle(.filledBlue)
    }

    private func presentApiData() {
        let infoSellerData = viewModel.getInfoSellerData()
        
    }
}

// MARK: - Private Handlers

//
private extension InfoSellerViewController {

    private func callInfoSellerApi() {
        viewModel.loadSellerInfo()
        reloadInfoSellerCollectionViewData()
    }

    private func reloadInfoSellerCollectionViewData() {
        viewModel.onReloadData = {
            self.infoSellerCollectionView.reloadData()
        }
    }
}
