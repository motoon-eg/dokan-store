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

    @IBOutlet weak var shopImage: UIImageView!
    @IBOutlet weak var sortingButton: UIButton!
    @IBOutlet weak var followButton: UIButton!

    // MARK: Properties

    private let viewModel: InfoSellerViewModelType

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
    }
}

// MARK: - Actions

//
extension InfoSellerViewController {}

// MARK: - Configurations

//
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
