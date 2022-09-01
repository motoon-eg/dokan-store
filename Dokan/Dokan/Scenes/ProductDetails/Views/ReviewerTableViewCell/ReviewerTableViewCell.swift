//
//  ReviewerTableViewCell.swift
//  Dokan
//
//  Created by raniazeid on 28/07/2022.
//

import Domain
import UIDokan
import UIKit

class ReviewerTableViewCell: UITableViewCell {

    // MARK: - Outlets

    @IBOutlet private(set) weak var reviewerImageView: UIImageView!
    @IBOutlet private(set) weak var reviewerNameLabel: UILabel!
    @IBOutlet private(set) weak var reviewerComment: UILabel!
    @IBOutlet private(set) weak var ratingStarsView: StarsView!

    // MARK: - life cycle..

    override func awakeFromNib() {
        super.awakeFromNib()
        reviewerImageView.applyCircleImageStyle()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 20, right: 0))
    }

    // MARK: - method to configure cell

    func configureCell(viewModel: ReviewerCellViewModel) {
        reviewerImageView.setImage(with: viewModel.reviewerImageUrl, placeholderImage: UIImage(named: "star") ?? UIImage())
        reviewerNameLabel.text = viewModel.reviewerName
        reviewerComment.text = viewModel.reviewerComment
        ratingStarsView.applyStyleToView(viewModel.rating)
    }
}

struct ReviewerCellViewModel {
    let reviewerImageUrl: String
    let reviewerName: String
    let reviewerComment: String
    let rating: Double
}
