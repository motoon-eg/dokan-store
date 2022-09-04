//
//  RatingProgressDetails.swift
//  Dokan
//
//  Created by marwa on 26/08/2022.
//

import UIDokan
import UIKit

class RatingProgressDetails: UIViewFromNib {

    // MARK: - Outlets

    @IBOutlet private(set) weak var contentView: UIView!
    @IBOutlet private(set) weak var starRating: StarsView!
    @IBOutlet private(set) weak var progressBarRating: UIProgressView!
    @IBOutlet private(set) weak var starsRatingLabel: UILabel!

    // MARK: - Properties

    var progressDetails: RatingProgressDetailsViewModel? {
        didSet {
            guard let progressDetails = progressDetails else {
                return
            }

            starRating.applyStyleToView()
            starRating.updateStarsRating(Double(progressDetails.starNumber))
            starsRatingLabel.text = String(progressDetails.rating)
            updateProgressBarRating(progressDetails: progressDetails)
        }
    }

    // MARK: - initializer

    override func awakeFromNib() {
        super.awakeFromNib()
        starRating.applyStyleToView()
        starRating.updateStarsRating(0)
    }
}

// MARK: - Private Handlers

private extension RatingProgressDetails {

    func updateProgressBarRating(progressDetails: RatingProgressDetailsViewModel) {
        progressBarRating.progress = Float(progressDetails.rating) / Float(progressDetails.totalRatingNumber)
    }
}

// MARK: - View Model

extension RatingProgressDetails {

    struct RatingProgressDetailsViewModel {
        let rating: Int
        let starNumber: Int
        let totalRatingNumber: Int
    }
}
