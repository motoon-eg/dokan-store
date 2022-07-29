//
//  SliderCollectionViewCell.swift
//  Dokan
//
//  Created by heba isaa on 19/07/2022.
//

import UIKit
import UIDokan

class SliderCollectionViewCell: UICollectionViewCell, NibLoadableView, ReusableView {

    // MARK: - Outlet

    @IBOutlet private weak var productImageView: UIImageView!
    @IBOutlet private weak var noOfCurrentPictureLabel: UILabel!
    @IBOutlet private weak var noOfPicturesLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()

    }

 // MARK: - Configurations

//     func configureProductPicture(image: UIImage, currentPictureNumber: Int) {
    
//        productPicture.image = image
    func configureProductPicture(currentPictureNumber: Int) {
        noOfPicturesLabel.text="\(currentPictureNumber)"

    }

}
