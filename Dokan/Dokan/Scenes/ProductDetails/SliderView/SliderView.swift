//
//  SliderView.swift
//  Dokan
//
//  Created by heba isaa on 10/08/2022.
//

import UIKit

class SliderView: UIView {

    // MARK: - Outlet

    @IBOutlet private(set) weak var sliderView: UIView!
    @IBOutlet private(set) weak var productSliderCollectionView: UICollectionView!
    
    // MARK: - Properties
    
    private var viewModel: [sliderViewModel]?

    // MARK: - initializer
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        collectionViewSetup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        collectionViewSetup()
    }
}

   // MARK: - CollectionView setup

 extension SliderView {

    func collectionViewSetup() {
        Bundle.main.loadNibNamed("SliderView", owner: self, options: nil)
        sliderView.fixInView(self)

        self.productSliderCollectionView.register(SliderCollectionViewCell.self)
        self.productSliderCollectionView.delegate = self
        self.productSliderCollectionView.dataSource = self
        collectionViewLayout()
    }
     func collectionViewLayout() {
         let layout = UICollectionViewFlowLayout()
         layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
         layout.itemSize = CGSize(width: (productSliderCollectionView.bounds.width)-5, height: productSliderCollectionView.bounds.height)
         layout.minimumInteritemSpacing = 15
         layout.minimumLineSpacing = 15
         layout.scrollDirection = .horizontal
         productSliderCollectionView.collectionViewLayout = layout
     }
}
   // MARK: - CollectionViewDelegate & Datasource

extension SliderView: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel?.count ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SliderCollectionViewCell = collectionView.dequeueReusableCell(for: indexPath)
        guard let model = viewModel else { return UICollectionViewCell() }
        cell.configureCellData(viewModel: model[indexPath.row])
        return cell
    }
}

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
