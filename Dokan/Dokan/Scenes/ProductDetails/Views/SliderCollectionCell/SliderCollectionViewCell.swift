//
//  SliderCollectionViewCell.swift
//  Dokan
//
//  Created by heba isaa on 19/07/2022.
//

import UIKit

class SliderCollectionViewCell: UICollectionViewCell {

    // MARK: - Outlet
    
    @IBOutlet weak var productPicture: UIImageView!
    @IBOutlet weak var noOfCurrentPicture: UILabel!
    @IBOutlet weak var noOfPicture: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
 // MARK: - Configurations

    private func configureProductPicture(image:UIImage){
        productPicture.image = image
    }

}
