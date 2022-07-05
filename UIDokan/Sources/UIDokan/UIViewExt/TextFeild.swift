//
//  File.swift
//  
//
//  Created by ziad on 05/07/2022.
//

import UIKit

 extension UITextField{
     public func textInputView(label: String, TFPlaceholder: String ){
         // Style
         placeholder = TFPlaceholder
         textColor = UIColor(named: "Navy Black")
         font = UIFont(name: "DMSans-Medium", size: 14)
         backgroundColor = UIColor(named: "Off Gray")

         // Constraints
         NSLayoutConstraint.activate([
             heightAnchor.constraint(equalToConstant: 50)
             ])
         // label Style
         let Label: UILabel = {
             let content = UILabel()
             content.text = label
             content.textColor = UIColor(named: "Navy Black")
             content.translatesAutoresizingMaskIntoConstraints = false
             return content
         }()
         addSubview(Label)
         // label Constraints
         Label.bottomAnchor.constraint(equalTo: topAnchor, constant: -10).isActive = true
     }
 }
