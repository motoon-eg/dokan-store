//
//  ReviewerTableViewCell.swift
//  Dokan
//
//  Created by raniazeid on 28/07/2022.
//

import UIDokan
import UIKit

class ReviewerTableViewCell: UITableViewCell {

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

    func configureCell(viewModel: ViewModel) {
        reviewerImageView.setImage(with: "", placeholderImage: UIImage(named: "star") ?? UIImage())
        reviewerNameLabel.text = viewModel.reviewerName
        reviewerComment.text = viewModel.reviewerComment
        ratingStarsView.applyStyleToView(viewModel.rating)
    }
}

extension ReviewerTableViewCell {
    struct ViewModel {
        let reviewerImageUrl: String
        let reviewerName: String
        let reviewerComment: String
        let rating: Double
    }
}
