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

    static let headerIdentifier = "SliderCollectionviewCell"

    // MARK: - Outlet

    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var noOfCurrentPictureLabel: UILabel!
    @IBOutlet private weak var noOfPicturesLabel: UILabel!
    var sliderViewModel: SliderViewModel? {
        didSet {
//            noOfPicturesLabel.text = "1"
//            productImageView.setImage(with: sliderViewModel!.productImage)
//            noOfCurrentPictureLabel.text = "1"
        }
    }

    // MARK: - initializer

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    // MARK: - Configurations
}

public struct SliderViewModel {
    var productImage: String
}
