//
//  ReviewProductViewController.swift
//  Dokan
//
//  Created by marwa on 16/08/2022.
//

import UIKit

class ReviewProductViewController: UIViewController {

    // MARK: Outlets

    @IBOutlet weak var fiveStarProgressBar: UIProgressView!
    @IBOutlet weak var reviewProductTableView: UITableView!

    // MARK: Properties

    private let viewModel: ReviewProductViewModelType
    var reviewProductList: [Any] = []

    // MARK: Init

    init(viewModel: ReviewProductViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewSetup()
        fiveStarProgressBar.progress = 70 / 86
    }
}

// MARK: - Actions

extension ReviewProductViewController {}

// MARK: - Configurations

extension ReviewProductViewController {
    func tableViewSetup() {
        let nib = UINib(nibName: Constants.tableViewCellName, bundle: nil)
        reviewProductTableView.register(nib, forCellReuseIdentifier: Constants.cellReuseIdentifier)
        reviewProductTableView.delegate = self
        reviewProductTableView.dataSource = self
        print("hello")
        // collectionViewLayout()
    }
}

// MARK: - Private Handlers

private extension ReviewProductViewController {}

// MARK: - CollectionView

extension ReviewProductViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! ReviewerTableViewCell
        // cell.reviewProductList = reviewProductList[indexPath.row]
        print("'doneeeeee'")
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}

// MARK: - Constants

extension ReviewProductViewController {

    private enum Constants {
        static let tableViewCellName = "ReviewerTableViewCell"
        static let cellReuseIdentifier = "ReviewerTableViewCell"
    }
}
