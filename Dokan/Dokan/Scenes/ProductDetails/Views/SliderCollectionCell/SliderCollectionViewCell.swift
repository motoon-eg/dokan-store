//
//  SliderCollectionViewCell.swift
//  Dokan
//
//  Created by heba isaa on 19/07/2022.
//

import UIKit
import Domain

class SliderCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {

    // MARK: - Outlet

    @IBOutlet weak var productPicture: UIImageView!
    @IBOutlet weak var noOfCurrentPicture: UILabel!
    @IBOutlet weak var noOfPicture: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()

    }

 // MARK: - Configurations

     func configureProductPicture(image: UIImage, currentPictureNumber: Int) {
        productPicture.image = image
        noOfCurrentPicture.text="\(currentPictureNumber)"

    }

}
