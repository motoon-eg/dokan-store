//
//  ReviewsView.swift
//  Dokan
//
//  Created by Clara Mounir Adly on 19/08/2022.
//

import UIDokan
import UIKit

// MARK: - ReviewsView

final class ReviewsView: UIViewFromNib {

    // MARK: Outlets

    @IBOutlet private(set) weak var contentView: UIView!
    @IBOutlet private(set) weak var reviewsLabel: UILabel!
    @IBOutlet private(set) weak var ratingLabel: UILabel!
    @IBOutlet private(set) weak var tableView: UITableView!
    @IBOutlet private(set) weak var seeAllReviewsButton: UIButton!
//    @IBOutlet private(set) weak var reviewImageView: UIImageView!

    // MARK: Properties

    private var viewModel: ReviewsUiModel?

    // MARK: Lifecycle

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        Bundle.main.loadNibNamed("ReviewsView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
//        contentView.fixInView(self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(ReviewerTableViewCell.self, forCellReuseIdentifier: "ReviewerTableViewCell")
    }
}

// MARK: - UITableViewDataSource Conformance

extension ReviewsView: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.reviews.count ?? .zero
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewerTableViewCell") as? ReviewerTableViewCell,
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
        NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
        NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
    }
}
