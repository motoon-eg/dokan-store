//
//  ReviewProductNavigationBarBehavior.swift
//  Dokan
//
//  Created by marwa on 18/08/2022.
//

import Foundation
import UIKit

class ReviewProductNavigationBarBehavior {

    // MARK: - Properties

    private unowned var navigationItem: UINavigationItem
    private var onBack: () -> Void = {}

    // MARK: - Init

    init(navigationItem: UINavigationItem) {
        self.navigationItem = navigationItem
    }

    // MARK: - Configuration

    func configure(_ rating: Double, onBack: @escaping () -> Void) {

        // MARK: Add back button to navigation bar

        self.onBack = onBack
        let backButton = UIBarButtonItem(image: UIImage(named: "left")?.withRenderingMode(.alwaysOriginal),
                                         style: .done,
                                         target: self,
                                         action: #selector(backWasTapped))

        navigationItem.leftBarButtonItem = backButton

        // MARK: Add star image and rating label

        let ratingStackView: UIStackView = {
            let ratingLabel = UILabel()
            ratingLabel.textAlignment = .left
            ratingLabel.text = String(rating)
            ratingLabel.textColor = .black
            let starImage = UIImageView()
            starImage.image = UIImage(named: "star")
            let stackView = UIStackView(arrangedSubviews: [starImage, ratingLabel])
            stackView.axis = .horizontal
            stackView.spacing = 8
            return stackView
        }()

        let customViewItem = UIBarButtonItem(customView: ratingStackView)
        navigationItem.rightBarButtonItem = customViewItem

        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .done, target: self, action: nil)
    }

    // MARK: - Action

    @objc private func backWasTapped() {
        onBack()
    }
}
