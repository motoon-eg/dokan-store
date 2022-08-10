//
//  SliderCollectionViewCell.swift
//  Dokan
//
//  Created by heba isaa on 19/07/2022.
//

import UIKit
import UIDokan

class SliderCollectionViewCell: UICollectionViewCell {
    // MARK: - Propperties

    static let headerIdentifier = "SliderCollectionview"

    // MARK: - Outlet

    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var noOfCurrentPictureLabel: UILabel!
    @IBOutlet private weak var noOfPicturesLabel: UILabel!

    // MARK: - Life cycle

    override func awakeFromNib() {
        super.awakeFromNib()
    }

 // MARK: - Configurations

    func configureCellData(viewModel: sliderViewModel) {
        noOfPicturesLabel.text="\(viewModel.noOfCurrentPicture)"
        productImageView.image = viewModel.productImage

    }

}

