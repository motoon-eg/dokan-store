//
//  ReviewsSectionView.swift
//  Dokan
//
//  Created by Omar Ahmed on 07/09/2022.
//

import UIKit

class ReviewsSectionView: UIView {

    // MARK: - Outlets

    @IBOutlet var contentView: ReviewsSectionView!

    @IBOutlet weak var numberOfReviews: UILabel!

    @IBOutlet weak var ratingLabel: UILabel!

    @IBOutlet weak var reviewsCollectionView: UICollectionView!

    @IBOutlet weak var seeAllReviewsButton: UIButton!

    // MARK: - Properties

    var viewModel = ProductDetailsViewModel()

    // MARK: - initializer

    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewSetup()
    }
}

// MARK: - Setup

private extension ReviewsSectionView {

    func viewSetup() {
        Bundle.main.loadNibNamed(ReviewsConstants.viewNibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionViewSetup()
        buttonStyle()
    }

    func collectionViewSetup() {
        let nib = UINib(nibName: ReviewsConstants.collectionViewCellName, bundle: nil)
        reviewsCollectionView.register(nib, forCellWithReuseIdentifier: ReviewsConstants.cellReuseIdentifier)
        reviewsCollectionView.delegate = self
        reviewsCollectionView.dataSource = self
        collectionViewLayout()
    }

    func collectionViewLayout() {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: reviewsCollectionView.frame.width * 0.84, height: 110)
        layout.minimumInteritemSpacing = ReviewsConstants.collectionViewLayoutInteritemSpacing
        layout.minimumLineSpacing = ReviewsConstants.collectionViewLayoutLineSpacing
        reviewsCollectionView.collectionViewLayout = layout
    }

    private func buttonStyle() {
        seeAllReviewsButton.layer.cornerRadius = 10
        seeAllReviewsButton.layer.borderWidth = 1
        seeAllReviewsButton.layer.borderColor = UIColor.black.cgColor
    }
}

// MARK: - Binding

// MARK: - Actions

extension ReviewsSectionView {}

// MARK: - CollectionView

extension ReviewsSectionView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ReviewsConstants.cellReuseIdentifier, for: indexPath) as! ReviewerCollectionViewCell

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
}

// MARK: - Constants

extension ReviewsSectionView {

    private enum ReviewsConstants {
        static let collectionViewCellName = "ReviewerCollectionViewCell"
        static let cellReuseIdentifier = "ReviewerCell"
        static let viewNibName = "ReviewsSectionView"
        static let collectionViewLayoutInteritemSpacing = 15.0
        static let collectionViewLayoutLineSpacing = 15.0
    }
}

public struct ReviewerViewModel {
    let reviewerImage: String
    let reviewerName: String
    let reviewerComment: String
    let dateOfReview: String
    let rate: Int
}
