//
//  ViewController.swift
//  Dokan
//
//  Created by Omar Ahmed on 21/07/2022.
//

import UIKit

class TryViewController: UIViewController {
    
    let InfoView = InfoSellerView()

    override func viewDidLoad() {
        super.viewDidLoad()
        InfoView.frame = CGRect(x: 25, y: (Int(view.frame.height) / 2) - 103, width: 325, height: 103)
        self.view.addSubview(InfoView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
