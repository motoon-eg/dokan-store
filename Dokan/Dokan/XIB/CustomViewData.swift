//
//  CustomViewData.swift
//
//  Created by heba isaa on 24/06/2022.

import UIKit

class CustomViewData: UIViewFromNib {
    
    @IBOutlet weak var valueTF: UITextField!
    @IBOutlet private weak var titleTxt: UILabel!
    
    
    @IBInspectable var text:String?{
        didSet {
        textViewEdit()
      }
    }


    func textViewEdit() {
        titleTxt.text = self.text
         
     }

}
