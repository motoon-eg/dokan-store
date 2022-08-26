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
    @IBOutlet weak var starRating: StarsView!
    @IBOutlet weak var progressBarRating: UIProgressView!
    @IBOutlet weak var starsRatingLabel: UILabel!

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

private extension RatingProgressDetails {

    func viewSetup() {
        Bundle.main.loadNibNamed(Constants.viewNibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        starRating.applyStyleToView(5)
    }
}

private extension RatingProgressDetails {}

// MARK: - Constants

extension RatingProgressDetails {

    private enum Constants {
        static let viewNibName = "RatingProgressDetails"
    }
}
