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

    @IBOutlet private(set) weak var fiveStarProgressBar: UIProgressView!
    @IBOutlet private(set) weak var fourStarProgressBar: UIProgressView!
    @IBOutlet private(set) weak var threeStarProgressBar: UIProgressView!
    @IBOutlet private(set) weak var twoStarProgressBar: UIProgressView!
    @IBOutlet private(set) weak var oneStarProgressBar: UIProgressView!
    @IBOutlet private(set) weak var reviewProductTableView: UITableView!
    @IBOutlet private(set) weak var fiveStarRating: StarsView!
    @IBOutlet private(set) weak var fourStarRating: StarsView!
    @IBOutlet private(set) weak var threeStarRating: StarsView!
    @IBOutlet private(set) weak var twoStarRating: StarsView!
    @IBOutlet private(set) weak var oneStarRating: StarsView!
    @IBOutlet private(set) weak var fiveStarRatingLabel: UILabel!
    @IBOutlet private(set) weak var fourStarRatingLabel: UILabel!
    @IBOutlet private(set) weak var threeStarRatingLabel: UILabel!
    @IBOutlet private(set) weak var twoStarRatingLabel: UILabel!
    @IBOutlet private(set) weak var oneStarRatingLabel: UILabel!
    @IBOutlet private(set) weak var totalReviewsNumberLabel: UILabel!
    @IBOutlet private(set) weak var ratingLabel: UILabel!

    // MARK: Properties

    private let viewModel: ReviewProductViewModelType
    private var navigationBarBehavior: ReviewProductNavigationBarBehavior?
    var reviewProductList: [Domain.Review] = []

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
        starRatingStyleSetup()
        bindViewModel()
        // configureNavBar()
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
    }

    func starRatingStyleSetup() {
        fiveStarRating.applyStyleToView(5)
        fourStarRating.applyStyleToView(4)
        threeStarRating.applyStyleToView(3)
        twoStarRating.applyStyleToView(2)
        oneStarRating.applyStyleToView(1)
    }

    func configureNavBar(rating: Double = 0.0) {
        title = "Review Product"
        navigationBarBehavior = ReviewProductNavigationBarBehavior(navigationItem: navigationItem)
        // TODO: - pass rating data to the parameter of configure function
        navigationBarBehavior?.configure(rating, onBack: {
            print("onBack is tapped")
        })
    }

    func bindViewModel() {
        viewModel.loadReviews { [weak self] ProductReviews in
            guard let self = self else { return }
            self.configureNavBar(rating: ProductReviews.rating)
            self.updateTotalReviewsLabel(ProductReviews.totalRatingNumber, ProductReviews.rating)
            self.updateReviewsTableViewCell(productReviews: ProductReviews.reviews)
            self.updateRatingProgressBarAndLabel(ProductReviews.fiveStarRatingNumber,
                                                 ProductReviews.fourStarRatingNumber,
                                                 ProductReviews.threeStarRatingNumber,
                                                 ProductReviews.twoStarRatingNumber,
                                                 ProductReviews.oneStarRatingNumber,
                                                 ProductReviews.totalRatingNumber)
        }
    }
}

// MARK: - Private Handlers

private extension ReviewProductViewController {

    func updateRatingProgressBarAndLabel(_ fiveStarRatingNumber: Int,
                                         _ fourStarRatingNumber: Int,
                                         _ threeStarRatingNumber: Int,
                                         _ twoStarRatingNumber: Int,
                                         _ oneStarRatingNumber: Int,
                                         _ totalRatingNumber: Int) {

        // MARK: update rating progress bar

        fiveStarProgressBar.progress = Float(fiveStarRatingNumber) / Float(totalRatingNumber)
        fourStarProgressBar.progress = Float(fourStarRatingNumber) / Float(totalRatingNumber)
        threeStarProgressBar.progress = Float(threeStarRatingNumber) / Float(totalRatingNumber)
        twoStarProgressBar.progress = Float(twoStarRatingNumber) / Float(totalRatingNumber)
        oneStarProgressBar.progress = Float(oneStarRatingNumber) / Float(totalRatingNumber)

        // MARK: Update rating labels

        fiveStarRatingLabel.text = String(fiveStarRatingNumber)
        fourStarRatingLabel.text = String(fourStarRatingNumber)
        threeStarRatingLabel.text = String(threeStarRatingNumber)
        twoStarRatingLabel.text = String(twoStarRatingNumber)
        oneStarRatingLabel.text = String(oneStarRatingNumber)
    }

    // MARK: - Update total rating and reviews labels

    func updateTotalReviewsLabel(_ totalReviewsNumber: Int, _ rating: Double) {
        ratingLabel.text = String(rating)
        totalReviewsNumberLabel.text = String(totalReviewsNumber) + " Reviews"
    }

    // MARK: - Update reviews table view cell

    func updateReviewsTableViewCell(productReviews: [Domain.Review]) {
        reviewProductList = productReviews
        reviewProductTableView.reloadData()
    }
}

// MARK: - TableView

extension ReviewProductViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewProductList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! ReviewerTableViewCell

        // TODO: - Get reviewProductList[indexPath.row] and send it to cell

        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - Constants

extension ReviewProductViewController {

    private enum Constants {
        static let tableViewCellName = "ReviewerTableViewCell"
        static let cellReuseIdentifier = "ReviewerTableViewCell"
    }
}
