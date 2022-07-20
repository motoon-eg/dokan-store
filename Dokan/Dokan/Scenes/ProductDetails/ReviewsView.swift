//
//  ReviewsView.swift
//  Dokan
//
//  Created by Clara Mounir Adly on 16/07/2022.
//

import Foundation
import UIKit

class ReviewsView: UIView, UITableViewDelegate, UITableViewDataSource {
    
    var uiMODEL: ReviewsUiModel?
   // MARK: outlets
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var reviews: UILabel!
    @IBOutlet weak var rating: UILabel!
    @IBOutlet weak var customerReview: UITableView!
    @IBOutlet weak var seeAllReviewsButton: UIButton!
    
    // MARK: functions
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        uiMODEL!.reviews.count
    }
    
   // func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 //       guard let cell = tableView.dequeueReusableCell(withIdentifier: " ") else { return // } ?? <#default value#> //as! // asm el class bta3 el cell
      
    //    return cell
  //  }
    
    override init(frame: CGRect) {
          super.init(frame: frame)
          commonInit()
        
        customerReview.dataSource = self
        customerReview.delegate = self
      }
      required init?(coder aDecoder: NSCoder) {
          super.init(coder: aDecoder)
          commonInit()
      }
      func commonInit() {
          Bundle.main.loadNibNamed("ReviewsView", owner: self, options: nil)
          contentView.fixInView(self)
      }
  }

  extension UIView
  {
      func fixInView(_ container: UIView!) -> Void{
          self.translatesAutoresizingMaskIntoConstraints = false;
          self.frame = container.frame;
          container.addSubview(self);
          NSLayoutConstraint(item: self, attribute: .leading, relatedBy: .equal, toItem: container, attribute: .leading, multiplier: 1.0, constant: 0).isActive = true
          NSLayoutConstraint(item: self, attribute: .trailing, relatedBy: .equal, toItem: container, attribute: .trailing, multiplier: 1.0, constant: 0).isActive = true
          NSLayoutConstraint(item: self, attribute: .top, relatedBy: .equal, toItem: container, attribute: .top, multiplier: 1.0, constant: 0).isActive = true
          NSLayoutConstraint(item: self, attribute: .bottom, relatedBy: .equal, toItem: container, attribute: .bottom, multiplier: 1.0, constant: 0).isActive = true
      }
}

struct Review{
    
}
struct ReviewsUiModel{
    var reviewsCount: Int
    var rate: Double
    var reviews: [Review]
    
}

