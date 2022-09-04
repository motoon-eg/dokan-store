//
//  ReviewerTableViewCell.swift
//  Dokan
//
//  Created by raniazeid on 28/07/2022.
//
import Domain
import UIDokan
import UIKit

class ReviewerTableViewCell: UITableViewCell, IdentifiableView {

    // MARK: - Outlets

    @IBOutlet private weak var reviewerImageView: UIImageView!
    @IBOutlet private weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var reviewerComment: UILabel!
    @IBOutlet weak var ratingStarsView: StarsView!

    // MARK: - life cycle..

    override func awakeFromNib() {
        super.awakeFromNib()
        reviewerImageView.applyCircleImageStyle()
    }

    // MARK: - method to configure cell

    func configureCell(viewModel: ReviewerCellViewModel) {
        reviewerImageView.setImage(with: viewModel.reviewerImageUrl, placeholderImage: .star)
        reviewerNameLabel.text = viewModel.reviewerName
        reviewerComment.text = viewModel.reviewerComment
        ratingStarsView.applyStyleToView()
        ratingStarsView.updateStarsRating(viewModel.rating)
    }

    // MARK: - View Model

    struct ReviewerCellViewModel {
        let reviewerImageUrl: String
        let reviewerName: String
        let reviewerComment: String
        let rating: Double
    }
}
