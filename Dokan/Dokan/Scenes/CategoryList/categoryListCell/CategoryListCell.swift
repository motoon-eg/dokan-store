//
//  CategoryListCell.swift
//  Dokan
//
//  Created by heba isaa on 17/08/2022.
//

import UIKit
import UIDokan

class CategoryListCell: UICollectionViewCell,IdentifiableView {
    
    //MARK: - Outlet
    
    @IBOutlet weak private(set) var categoryImage: UIImageView!
    @IBOutlet weak private(set) var categoryTitle: UILabel!
    @IBOutlet weak private(set) var categoryPrice: UILabel!
    @IBOutlet weak private(set) var categoryReview: UILabel!
    @IBOutlet weak private(set) var noOfReviewer: UILabel!
    @IBOutlet weak private(set) var moreActionBtn: UIButton!
    
    //MARK: -  Initialization
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Cell  Configuration
    
    func configureCell(viewModel: categoryViewModel) {
        categoryImage.image = viewModel.categoryImage
        categoryTitle.text = viewModel.categoryTitle
        categoryPrice.text = viewModel.categoryPrice
        categoryReview.text = "\(viewModel.categoryReview)"
        noOfReviewer.text = viewModel.noOfReviewer
        
        
    }
    
}

//MARK: - category Model

extension CategoryListCell{
    
    struct categoryViewModel{
        let categoryImage:UIImage
        let categoryTitle:String
        let categoryPrice:String
        let categoryReview:String
        let noOfReviewer:Int
        
    }
    
}
