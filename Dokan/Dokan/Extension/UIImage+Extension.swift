//
//  UIImage+Extension.swift
//  Dokan
//
//  Created by raniazeid on 07/08/2022.
//

import Foundation
import Kingfisher
import UIKit

protocol ImageSetable {
    func setImage(with urlString: String, placeholderImage: UIImage)
}

extension UIImageView: ImageSetable {
    func setImage(with urlString: String, placeholderImage: UIImage) {
        let url = URL(string: urlString)
        kf.setImage(with: url,
                    placeholder: placeholderImage,
                    options: [.transition(.fade(0.5))],
                    progressBlock: nil, completionHandler: nil)
    }
}
