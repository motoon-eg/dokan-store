//
//  reviewTableViewCell.swift
//  Dokan
//
//  Created by raniazeid on 20/07/2022.
//

import UIKit

class ReviewTableViewCell: UITableViewCell {

    @IBOutlet weak var reviewerImageView: UIImageView!
    @IBOutlet weak var reviewerName: UILabel!
    @IBOutlet weak var reviewerComment: UITextView!
   
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCell(reviewTableViewCellViewModel : ReviewTableViewCellViewModel){
        
        self.reviewerImageView.setImage(with: reviewTableViewCellViewModel.reviewerImage)
        self.reviewerName.text = reviewTableViewCellViewModel.reviewerName
        self.reviewerComment.text = reviewTableViewCellViewModel.reviewerComment
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}

struct ReviewTableViewCellViewModel{
    var reviewerImage : String
    var reviewerName : String
    var reviewerComment : String
}


