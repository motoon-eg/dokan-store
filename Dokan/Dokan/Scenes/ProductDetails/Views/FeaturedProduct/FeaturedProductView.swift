//
//  FeaturedProductView.swift
//  Dokan
//
//  Created by marwa on 26/07/2022.
//

import UIKit

class FeaturedProductView: UIView {
    
    @IBOutlet private(set) var contentView: UIView!
    @IBOutlet private(set) weak var featuredProductCollectionView: UICollectionView!
    @IBOutlet private(set) weak var featuredProductTitle: UILabel!
    @IBOutlet private(set) weak var seeAllButton: UIButton!
    
    var featuredProducts: Array<Any> = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        viewSetup()
    }
}

extension FeaturedProductView {
    
    private func viewSetup() {
        Bundle.main.loadNibNamed(Constants.viewNibName, owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        collectionViewSetup()
    }
    
    private func collectionViewSetup() {
        let nib = UINib(nibName: Constants.collectionViewCellName, bundle: nil)
        featuredProductCollectionView.register(nib, forCellWithReuseIdentifier: Constants.cellReuseIdentifier)
        featuredProductCollectionView.delegate = self
        featuredProductCollectionView.dataSource = self
        collectionViewLayout()
    }
    
    func collectionViewLayout() {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = Constants.collectionViewLayoutSectionInset
        layout.itemSize = CGSize(width: featuredProductCollectionView.frame.width/2.25, height: featuredProductCollectionView.frame.height)
        layout.minimumInteritemSpacing = Constants.collectionViewLayoutInteritemSpacing
        layout.minimumLineSpacing = Constants.collectionViewLayoutLineSpacing
        layout.scrollDirection = .horizontal
        featuredProductCollectionView.collectionViewLayout = layout
    }
}

extension FeaturedProductView {
    
    @IBAction func featuredProductButtonAction(_ sender: Any) {
    }
    
}

extension FeaturedProductView: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.cellReuseIdentifier, for: indexPath) as! FeaturedProductCollectionViewCell
        cell.featuredProduct = featuredProducts[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return featuredProducts.count
    }
}

extension FeaturedProductView {
    
    enum Constants {
        static let collectionViewCellName = "FeaturedProductCollectionViewCell"
        static let cellReuseIdentifier = "FeaturedProductCell"
        static let viewNibName = "FeaturedProductView"
        static let collectionViewLayoutSectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        static let collectionViewLayoutInteritemSpacing = 15.0
        static let collectionViewLayoutLineSpacing = 15.0
    }
}
