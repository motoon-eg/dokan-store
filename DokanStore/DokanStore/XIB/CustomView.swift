//
//  CustomView.swift
//  DokanStore
//
//  Created by heba isaa on 18/06/2022.
//

import UIKit

class CustomView: UIViewFromNib {

    @IBOutlet weak var valueTF: UITextField!
    @IBOutlet weak var titleTxt: UILabel!
    
    @IBInspectable var text:String?{
       didSet {
       textViewEdit()
     }
   }

   func textViewEdit() {
       titleTxt.text = self.text
        
    }
}
