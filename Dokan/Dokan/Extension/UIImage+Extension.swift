//
//  UIImage+Extension.swift
//  Dokan
//
//  Created by raniazeid on 25/07/2022.
//

import Foundation
import Kingfisher
import UIKit

protocol ImageSetable {
      func setImage(with urlString: String , placeholderImage : UIImage)
}
extension UIImageView : ImageSetable {

    func setImage(with urlString: String , placeholderImage : UIImage) {
         let url = URL(string: urlString)
         self.kf.setImage(with: url,
                          placeholder: placeholderImage),
                          options: [.transition(.fade(0.5))],
                          progressBlock: nil, completionHandler: nil)
     }
 }
