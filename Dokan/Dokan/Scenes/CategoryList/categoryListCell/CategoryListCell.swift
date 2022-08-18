//
//  CategoryListCell.swift
//  Dokan
//
//  Created by heba isaa on 17/08/2022.
//

import UIDokan
import UIKit

class CategoryListCell: UICollectionViewCell, IdentifiableView {

    // MARK: - Outlet

    @IBOutlet private(set) weak var categoryImage: UIImageView!
    @IBOutlet private(set) weak var categoryTitle: UILabel!
    @IBOutlet private(set) weak var categoryPrice: UILabel!
    @IBOutlet private(set) weak var categoryReview: UILabel!
    @IBOutlet private(set) weak var noOfReviewer: UILabel!
    @IBOutlet private(set) weak var moreActionBtn: UIButton!

    // MARK: -  Initialization

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Cell  Configuration

    func configureCell(viewModel: categoryViewModel) {
        categoryImage.image = viewModel.categoryImage
        categoryTitle.text = viewModel.categoryTitle
        categoryPrice.text = viewModel.categoryPrice
        categoryReview.text = viewModel.categoryReview
        noOfReviewer.text = "\(viewModel.noOfReviewer)"
    }
}

// MARK: - category Model

extension CategoryListCell {

    struct categoryViewModel {
        let categoryImage: UIImage
        let categoryTitle: String
        let categoryPrice: String
        let categoryReview: String
        let noOfReviewer: Int
    }
}
