//
//  LoadingButton.swift
//  Dokan
//
//  Created by Ahmed Nagy on 11/08/2022.
//

import UIKit

class LoadingButton: UIButton {

    private var isButtonTapped = false
    private var activityIndicator = UIActivityIndicatorView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func addButtontoCartTapped(completed: () -> Void) {
        isButtonTapped.toggle()
        showIndicator()
        if isButtonTapped {
            configureButtonState(isTapped: isButtonTapped)
            completed()
        } else {
            configureButtonState(isTapped: isButtonTapped)
            completed()
        }
    }
    
    private func configureButtonState(isTapped: Bool) {
        if isTapped {
            self.setTitle("Remove from Cart", for: .normal)
            self.setImage(UIImage(systemName: "cart.fill"), for: .normal)
        } else {
            self.setTitle("Add to cart", for: .normal)
            self.setImage(UIImage(systemName: "cart"), for: .normal)
        }
    }
    
    // MARK: - ActivityIndicator Configuration
    //
    private func showIndicator() {
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.isEnabled = false
        self.addSubview(activityIndicator)
        positionActivityIndicatorInButton()
        activityIndicator.startAnimating()
        Timer.scheduledTimer(withTimeInterval: 0.7, repeats: false) { _ in
            self.stopAnimating()
        }
    }
    
    private func stopAnimating() {
        self.isEnabled = true
        activityIndicator.stopAnimating()
        activityIndicator.removeFromSuperview()
    }
    
    private func positionActivityIndicatorInButton() {
        let trailingConstraint = NSLayoutConstraint(item: self,
                                                    attribute: .trailing,
                                                    relatedBy: .equal,
                                                    toItem: activityIndicator,
                                                    attribute: .trailing,
                                                    multiplier: 1, constant: 16)
        self.addConstraint(trailingConstraint)
        
        let yCenterConstraint = NSLayoutConstraint(item: self,
                                                   attribute: .centerY,
                                                   relatedBy: .equal,
                                                   toItem: activityIndicator,
                                                   attribute: .centerY,
                                                   multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
        NSLayoutConstraint.activate([
            activityIndicator.leadingAnchor.constraint(equalTo: self.trailingAnchor, constant: 12),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
        ])
    }

}
