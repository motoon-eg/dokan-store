//
//  RatingDetailsView.swift
//  Dokan
//
//  Created by marwa on 26/08/2022.
//

import UIDokan
import UIKit

class RatingDetailsView: UIView {

    // MARK: - Outlets

    @IBOutlet private(set) weak var contentView: UIView!
    @IBOutlet private(set) weak var totalReviewsNumberLabel: UILabel!
    @IBOutlet private(set) weak var ratingLabel: UILabel!

    @IBOutlet private(set) weak var fiveStarRating: RatingProgressDetails!
    @IBOutlet private(set) weak var fourStarRating: RatingProgressDetails!
    @IBOutlet private(set) weak var threeStarRating: RatingProgressDetails!
    @IBOutlet private(set) weak var twoStarRating: RatingProgressDetails!
    @IBOutlet private(set) weak var oneStarRating: RatingProgressDetails!

    // MARK: - Properties

    var ratingDetails: RatingDetailsViewModel? {
        didSet {
            guard let ratingDetails = ratingDetails else {
                return
            }

            updateStarProgressBar(ratingDetails: ratingDetails)
            updateTotalRatingLabel(ratingDetails: ratingDetails)
            updateTotalReviewsNumberLabel(ratingDetails: ratingDetails)
        }
    }

    // MARK: - initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewSetup()
    }
}

// MARK: - Setup

private extension RatingDetailsView {

    func viewSetup() {
        Bundle.main.loadNibNamed(Constants.viewNibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    }
}

// MARK: - Private Handlers

private extension RatingDetailsView {

    func updateTotalRatingLabel(ratingDetails: RatingDetailsViewModel) {
        ratingLabel.text = ratingDetails.configureRatingLabel()
    }

    func updateTotalReviewsNumberLabel(ratingDetails: RatingDetailsViewModel) {
        totalReviewsNumberLabel.text = ratingDetails.configureTotalReviewsNumberLabel()
    }

    func updateStarProgressBar(ratingDetails: RatingDetailsViewModel) {
        fiveStarRating.progressDetails = ratingDetails.configureFiveStarProgressBar()
        fourStarRating.progressDetails = ratingDetails.configureFourStarProgressBar()
        threeStarRating.progressDetails = ratingDetails.configureThreeStarProgressBar()
        twoStarRating.progressDetails = ratingDetails.configureTwoStarProgressBar()
        oneStarRating.progressDetails = ratingDetails.configureOneStarProgressBar()
    }
}

// MARK: - Constants

extension RatingDetailsView {

    private enum Constants {
        static let viewNibName = "RatingDetailsView"
    }
}
