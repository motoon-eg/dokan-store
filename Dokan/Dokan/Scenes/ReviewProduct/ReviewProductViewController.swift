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
    @IBOutlet private(set) weak var ratingDetailsView: RatingDetailsView!

    // MARK: Properties

    private var viewModel: ReviewProductViewModelType
    private var navigationBarBehavior: ReviewProductNavigationBarBehavior?
    private var reviewCount: Int = 10
    private var loadingCell: Bool = true

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
}

// MARK: - bind view model

extension ReviewProductViewController {

    func bindViewModel() {

        viewModel.showAlertClosure = { () in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }

                let message = self.viewModel.alertMessage
                self.showErrorAlert(error: message)
            }
        }

        viewModel.showNavBarClosure = { () in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }

                let rating = self.viewModel.navBarRating
                self.configureNavBar(rating: rating)
            }
        }

        viewModel.updateLoadingStatus = { [weak self] () in
            guard let self = self else { return }

            switch self.viewModel.state {
            case .empty, .error:
                self.mainStackView.isHidden = true
            case .loading:
                self.mainStackView.isHidden = false
                self.loadingCell = true
                self.mainStackView.startSkeletonView()
            case .loaded:
                self.mainStackView.isHidden = false
                self.loadingCell = false
                self.mainStackView.stopSkeletonView()
            }
        }

        viewModel.reloadTableViewClosure = { () in
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }

                self.reviewCount = self.viewModel.numberOfCells
                self.reviewProductTableView.reloadData()
            }
        }

        viewModel.configureFetchRatingDetails { [weak self] reviews in
            guard let self = self else { return }
            guard let reviews = reviews else {
                return
            }
            self.ratingDetailsView.ratingDetails = reviews
        }

        viewModel.loadReviews()
    }
}

// MARK: - Private Handlers

private extension ReviewProductViewController {

    // MARK: Show error alert

    func showErrorAlert(error: String) {
        UIAlertController.Builder()
            .title(Constants.errorAlertTitle)
            .message(error)
            .addActionWithTitle(Constants.errorAlertBackButton, style: .default, handler: { _ in
                // TODO: back to previous screen
            })
            .addActionWithTitle(Constants.errorAlertTryAgainButton, style: .default, handler: { _ in
                self.viewModel.loadReviews()
            })
            .show(in: self)
    }
}

// MARK: - TableView

extension ReviewProductViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewCount
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! ReviewerTableViewCell

        if loadingCell {
            cell.startSkeletonView()
        } else {
            cell.stopSkeletonView()
            let cellVM = viewModel.getCellViewModel(at: indexPath)
            cell.configureCell(viewModel: cellVM)
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
