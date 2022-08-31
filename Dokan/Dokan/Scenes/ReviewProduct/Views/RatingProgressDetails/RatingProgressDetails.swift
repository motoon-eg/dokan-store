//
//  RatingProgressDetails.swift
//  Dokan
//
//  Created by marwa on 26/08/2022.
//

import UIDokan
import UIKit

class RatingProgressDetails: UIView {

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

            starRating.applyStyleToView(Double(progressDetails.starNumber))
            starsRatingLabel.text = String(progressDetails.rating)
            updateProgressBarRating(progressDetails: progressDetails)
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

private extension RatingProgressDetails {

    func viewSetup() {
        Bundle.main.loadNibNamed(Constants.viewNibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        starRating.applyStyleToView(0)
    }
}

// MARK: - Private Handlers

private extension RatingProgressDetails {

    func updateProgressBarRating(progressDetails: RatingProgressDetailsViewModel) {
        progressBarRating.progress = Float(progressDetails.rating) / Float(progressDetails.totalRatingNumber)
    }
}

// MARK: - Constants

extension RatingProgressDetails {

    private enum Constants {
        static let viewNibName = "RatingProgressDetails"
    }
}

// MARK: - View Model

struct RatingProgressDetailsViewModel {
    let rating: Int
    let starNumber: Int
    let totalRatingNumber: Int
}
