//
//  ReviewerTableViewCell.swift
//  Dokan
//
//  Created by raniazeid on 28/07/2022.
//

import UIKit

class ReviewerTableViewCell: UITableViewCell {
    // MARK: - Outlets
    @IBOutlet weak private var reviewerImageView: UIImageView!
    @IBOutlet weak private var reviewerNameLabel: UILabel!
    @IBOutlet weak var reviewerComment: UILabel!
    
    // MARK: - life cycle..
    override func awakeFromNib() {
        super.awakeFromNib()
    }
        // MARK: - method to configure cell
        func configureCell(viewModel:ViewModel) {
            #warning("Image will be configure after add kingfisher")
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
    
