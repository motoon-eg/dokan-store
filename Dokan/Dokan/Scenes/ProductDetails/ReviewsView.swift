//
//  ReviewsView.swift
//  Dokan
//
//  Created by Clara Mounir Adly on 16/07/2022.
//
import Foundation
import UIKit

// MARK: - ReviewsView

final class ReviewsView: UIView {

    // MARK: Outlets

    @IBOutlet private(set) weak var contentView: UIView!
    @IBOutlet private(set) weak var reviewsLabel: UILabel!
    @IBOutlet private(set) weak var ratingLabel: UILabel!
    @IBOutlet private(set) weak var tableView: UITableView!
    @IBOutlet private(set) weak var seeAllReviewsButton: UIButton!
    @IBOutlet private(set) weak var reviewImageView: UIImageView!

    // MARK: Properties

    private var viewModel: ReviewsUiModel?

    // MARK: Lifecycle

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("ReviewsView", owner: self, options: nil)
        contentView.fixInView(self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ReviewerTableViewCell.self, forCellReuseIdentifier: "\(ReviewerTableViewCell.self)")
    }
}

// MARK: - UITableViewDataSource Conformance

extension ReviewsView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.reviews.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(ReviewerTableViewCell.self)") as? ReviewerTableViewCell,
              let viewModel = viewModel else {
            return UITableViewCell()
        }

        let review = viewModel.reviews[indexPath.row]
        cell.configureCell(viewModel: review)
        return cell
    }
}

// MARK: - UITableViewDelegate Conformance

extension ReviewsView: UITableViewDelegate {}
extension UIView {
    func fixInView(_ container: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        frame = container.frame
        container.addSubview(self)
        NSLayoutConstraint(item: self,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: container,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 0).isActive = true

        NSLayoutConstraint(item: self,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: container,
                           attribute: .trailing,
                           multiplier: 1.0,
                           constant: 0).isActive = true

        NSLayoutConstraint(item: self,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: container,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 0).isActive = true

        NSLayoutConstraint(item: self,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: container,
                           attribute: .bottom,
                           multiplier: 1.0,
                           constant: 0).isActive = true
    }
}
