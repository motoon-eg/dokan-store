//
//  CategoryFooterReusableView.swift
//  Dokan
//
//  Created by Ahmed Nagy on 26/08/2022.
//

import UIKit

class CategoryFooterReusableView: UICollectionReusableView {

    static let identifier = "CategoryFooterReusableView"
    private let button: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1).cgColor
        button.layer.borderWidth = 5
        button.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.setTitle("Filter & Sorting", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        addSubview(button)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        button.frame = bounds
    }
}
