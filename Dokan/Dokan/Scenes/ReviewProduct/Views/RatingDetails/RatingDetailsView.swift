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

    @IBOutlet weak var fiveStarRating: RatingProgressDetails!
    @IBOutlet weak var fourStarRating: RatingProgressDetails!
    @IBOutlet weak var threeStarRating: RatingProgressDetails!
    @IBOutlet weak var twoStarRating: RatingProgressDetails!
    @IBOutlet weak var oneStarRating: RatingProgressDetails!

    // MARK: - Properties

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
        fiveStarRating.starsRatingLabel.text = "9"
        fourStarRating.starsRatingLabel.text = "17"
    }

    // MARK: - Update total rating and reviews labels

    func updateTotalReviewsLabel(_ totalReviewsNumber: Int, _ rating: Double) {
        ratingLabel.text = String(rating)
        totalReviewsNumberLabel.text = String(totalReviewsNumber) + " Reviews"
    }
}

// MARK: - Constants

extension RatingDetailsView {

    private enum Constants {
        static let viewNibName = "RatingDetailsView"
    }
}
