//
//  ReviewerCollectionViewCell.swift
//  Dokan
//
//  Created by Omar Ahmed on 07/09/2022.
//

import UIDokan
import UIKit

class ReviewerCollectionViewCell: UICollectionViewCell {

    // MARK: Outlets

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var ratingView: StarsView!
    @IBOutlet weak var commentLabel: UILabel!

    // MARK: - life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
