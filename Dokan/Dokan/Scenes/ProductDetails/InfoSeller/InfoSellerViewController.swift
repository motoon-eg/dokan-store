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
    @IBOutlet private weak var name: UILabel!
    @IBOutlet private weak var locationAndTime: UILabel!
    @IBOutlet private weak var followersCount: UILabel!
    @IBOutlet private weak var productsCount: UILabel!
    @IBOutlet private weak var createdAt: UILabel!
    @IBOutlet weak var viewOfCollection: UIView!
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
        viewOfCollection.startSkeletonView()
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

        name.text = infoSellerData?.sellerName
        locationAndTime.text = (infoSellerData?.location ?? "") + " " + (infoSellerData?.workTime ?? "")
        followersCount.text = String(infoSellerData?.followers ?? 0)
        productsCount.text = String(infoSellerData?.productsCount ?? 0)
        createdAt.text = infoSellerData?.createdAt
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
            self.presentApiData()
            self.viewOfCollection.stopSkeletonView()
        }
    }
}
