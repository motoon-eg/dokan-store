//
//  SliderCollectionViewCell.swift
//  Dokan
//
//  Created by heba isaa on 19/07/2022.
//

import UIDokan
import UIKit

class SliderCollectionViewCell: UICollectionViewCell, IdentifiableView {
    // MARK: - Propperties

    static let headerIdentifier = "SliderCollectionview"

    // MARK: - Outlet

    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var noOfCurrentPictureLabel: UILabel!
    @IBOutlet private weak var noOfPicturesLabel: UILabel!

    // MARK: - initializer

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Configurations

    func configureCellData(viewModel: sliderViewModel) {
        noOfPicturesLabel.text = "\(viewModel.noOfCurrentPicture)"
        productImageView.image = viewModel.productImage
    }
}

extension SliderCollectionViewCell {
    struct sliderViewModel {
        var productImage: UIImage
        var noOfPicture: Int
        var noOfCurrentPicture: Int
    }
}
