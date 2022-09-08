//
//  CategoryListCell.swift
//  Dokan
//
//  Created by heba isaa on 17/08/2022.
//

import UIDokan
import UIKit

class CategoryCollectionViewCell: UICollectionViewCell, IdentifiableView {

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

    func configureCell(viewModel: ViewModel) {
        categoryImage.image = viewModel.image
        categoryTitle.text = viewModel.title
        categoryPrice.text = viewModel.price
        categoryReview.text = viewModel.review
        noOfReviewer.text = "\(viewModel.noOfReviewer)"
    }
}

// MARK: - category Model

extension CategoryCollectionViewCell {

    struct ViewModel {
        let image: UIImage
        let title: String
        let price: String
        let review: String
        let noOfReviewer: Int
    }
}
