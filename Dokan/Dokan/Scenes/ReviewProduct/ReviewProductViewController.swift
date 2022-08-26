//
//  ReviewProductViewController.swift
//  Dokan
//
//  Created by marwa on 16/08/2022.
//

import Domain
import Networking
import UIDokan
import UIKit

class ReviewProductViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet private(set) weak var reviewProductTableView: UITableView!
    @IBOutlet private(set) weak var mainStackView: UIStackView!

    // MARK: Properties

    private let viewModel: ReviewProductViewModelType
    private var navigationBarBehavior: ReviewProductNavigationBarBehavior?
    var reviewProductList: [Any] = [1, 2, 3, 4, 5, 5, 6, 7, 8, 9, 10]
    var loadingCell: Bool = true

    // MARK: Init

    init(viewModel: ReviewProductViewModelType) {
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
        tableViewSetup()
        bindViewModel()
        configureNavBar()
    }
}

// MARK: - Actions

extension ReviewProductViewController {}

// MARK: - Configurations

extension ReviewProductViewController {

    func tableViewSetup() {
        let nib = UINib(nibName: Constants.tableViewCellName, bundle: nil)
        reviewProductTableView.register(nib, forCellReuseIdentifier: Constants.cellReuseIdentifier)
        reviewProductTableView.delegate = self
        reviewProductTableView.dataSource = self
        tableViewLayout()
    }

    func tableViewLayout() {
        reviewProductTableView.estimatedRowHeight = reviewProductTableView.rowHeight
        reviewProductTableView.rowHeight = UITableView.automaticDimension
    }

    func configureNavBar(rating: Double = 0.0) {
        title = Constants.navBarTitle
        navigationBarBehavior = ReviewProductNavigationBarBehavior(navigationItem: navigationItem)
        navigationBarBehavior?.configure(rating, onBack: {
            // TODO: back to previous screen
        })
    }

    func loadReviewsData() {
        mainStackView.isHidden = false
        viewModel.loadReviews { [weak self] ProductReviews in
            guard let self = self else { return }
            self.configureNavBar(rating: ProductReviews.rating)
            self.updateReviewsTableViewCell(productReviews: ProductReviews.reviews)
        }
    }

    func configureShowError() {
        viewModel.configureShowError { [weak self] error in
            guard let self = self else { return }
            self.mainStackView.isHidden = true
            self.showErrorAlert(error: error)
        }
    }

    func configureLoading() {
        viewModel.configureLoadingEnabled { [weak self] enable in
            guard let self = self else { return }
            switch enable {
            case true:
                self.loadingCell = true
                self.mainStackView.startSkeletonView()
            case false:
                self.loadingCell = false
                self.mainStackView.stopSkeletonView()
            }
        }
    }

    func bindViewModel() {
        configureLoading()
        configureShowError()
        loadReviewsData()
    }
}

// MARK: - Private Handlers

private extension ReviewProductViewController {

    // MARK: - Update reviews table view cell

    func updateReviewsTableViewCell(productReviews: [Domain.Review]) {
        reviewProductList = productReviews
        reviewProductTableView.reloadData()
    }

    // MARK: - Show error alert

    func showErrorAlert(error: String) {
        UIAlertController.Builder()
            .title(Constants.errorAlertTitle)
            .message(error)
            .addActionWithTitle(Constants.errorAlertBackButton, style: .default, handler: { _ in
                // TODO: back to previous screen
            })
            .addActionWithTitle(Constants.errorAlertTryAgainButton, style: .default, handler: { _ in
                self.loadReviewsData()
            })
            .show(in: self)
    }
}

// MARK: - TableView

extension ReviewProductViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewProductList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! ReviewerTableViewCell

        if loadingCell {
            cell.startSkeletonView()
        } else {
            cell.stopSkeletonView()
            cell.reviewProduct = reviewProductList[indexPath.row] as? Domain.Review
        }

        return cell
    }
}

// MARK: - Constants

extension ReviewProductViewController {

    private enum Constants {
        static let tableViewCellName = "ReviewerTableViewCell"
        static let cellReuseIdentifier = "ReviewerTableViewCell"
        static let errorAlertTitle = "Error"
        static let errorAlertBackButton = "Back"
        static let errorAlertTryAgainButton = "Try Again"
        static let navBarTitle = "Review Product"
    }
}
