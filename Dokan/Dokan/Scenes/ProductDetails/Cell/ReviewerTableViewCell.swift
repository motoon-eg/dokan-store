//
//  ReviewerTableViewCell.swift
//  Dokan
//
//  Created by raniazeid on 28/07/2022.
//
import UIKit

class ReviewerTableViewCell: UITableViewCell {
// MARK: - Outlets
    @IBOutlet private(set) weak var reviewerImageView: UIImageView!
	    @IBOutlet private(set) weak var reviewerNameLabel: UILabel!
	    @IBOutlet private(set) weak var reviewerComment: UITextView!

// MARK: Lifecycle
    // MARK: Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: Cell Configurations
	
	    func configureCell(viewModel: ViewModel) {
	        reviewerNameLabel.text = viewModel.name
	        reviewerComment.text = viewModel.comment
	    }
}

// MARK: View Model
	
	extension ReviewerTableViewCell {
	    
	    struct ViewModel {
	        var imageUrl: String
	        var name: String
	        var comment: String
	    }
	}
}
