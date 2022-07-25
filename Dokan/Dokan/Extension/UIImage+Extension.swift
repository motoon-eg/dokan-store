//
//  UIImage+Extension.swift
//  Dokan
//
//  Created by raniazeid on 25/07/2022.
//

import Foundation
import Kingfisher
import UIKit


extension UIImageView{

    func setImage(with urlString: String , placeholderString : String ) {
         let url = URL(string: urlString)
         self.kf.setImage(with: url,
                          placeholder: #imageLiteral(resourceName: placeholderString),
                          options: [.transition(.fade(0.5))],
                          progressBlock: nil, completionHandler: { [weak self](result) in
                             switch result {
                             case .failure:
                                 self?.image =  #imageLiteral(resourceName: "personImage")
                             default:
                                 break
                             }
                          })
     }
 }
