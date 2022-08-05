//
//  ReviewerTableViewCell.swift
//  Dokan
//
//  Created by raniazeid on 28/07/2022.
//
import UIKit

class ReviewerTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewerImageView: UIImageView!

    @IBOutlet weak var reviewerNameLabel: UILabel!

    @IBOutlet weak var reviewerComment: UITextView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - method to configure cell

    func configureCell(reviewTableViewCellViewModel: ReviewTableViewCellViewModel) {
        reviewerNameLabel.text = reviewTableViewCellViewModel.reviewerName
        reviewerComment.text = reviewTableViewCellViewModel.reviewerComment
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

struct ReviewTableViewCellViewModel {
    var reviewerImage: String
    var reviewerName: String
    var reviewerComment: String
}
