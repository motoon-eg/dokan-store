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

    @IBOutlet private weak var reviewerImageView: UIImageView!
    @IBOutlet private weak var reviewerNameLabel: UILabel!
    @IBOutlet weak var reviewerComment: UILabel!
    @IBOutlet weak var ratingStarsView: StarsView!

    // MARK: - Properties

    var reviewProduct: Domain.Review! {
        didSet {
            reviewerImageView.setImage(with: reviewProduct.image, placeholderImage: UIImage(named: "star") ?? UIImage())
            reviewerNameLabel.text = reviewProduct.name
            reviewerComment.text = reviewProduct.reviewDescription
            ratingStarsView.applyStyleToView(Double(reviewProduct.rating))
        }
    }

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

    func configureCell(viewModel: ViewModel) {
        reviewerNameLabel.text = viewModel.reviewerName
        reviewerComment.text = viewModel.reviewerComment
    }
}

extension ReviewerTableViewCell {
    struct ViewModel {
        let reviewerImageUrl: String
        let reviewerName: String
        let reviewerComment: String
    }
}
