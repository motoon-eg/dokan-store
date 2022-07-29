//  
//  ProductDetailsViewController.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import UIKit

class ProductDetailsViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet weak var buttonsView: ButtonsView!
    
    // MARK: Properties
    
    private let viewModel: ProductDetailsViewModelType
    private var addingToCart = false {
        didSet {
            if #available(iOS 15.0, *) {
                buttonsView.addToCartButton.setNeedsUpdateConfiguration()
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    private var addingToFavorite = false {
        didSet {
            if #available(iOS 15.0, *) {
                buttonsView.addToFavoriteButton.setNeedsUpdateConfiguration()
            } else {
                // Fallback on earlier versions
            }
        }
    }
    
    // MARK: Init
    //
    init(viewModel: ProductDetailsViewModelType) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddToCartButton()
        setupAddToFavoriteButton()
    }
    
    
}

// MARK: - Actions
//
extension ProductDetailsViewController {
    
}

// MARK: - Configurations
//
extension ProductDetailsViewController {
    func setupAddToCartButton() {
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.filled()
            config.buttonSize = .large
            config.cornerStyle = .medium
            config.background.backgroundColor = UIColor(red: 0.996, green: 0.227, blue: 0.188, alpha: 1)
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.preferredFont(forTextStyle: .headline)
                return outgoing
            }
            config.image = UIImage(systemName: "chevron.right")
            config.imagePadding = 5
            config.imagePlacement = .trailing
            config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
            
            buttonsView.addToCartButton.addAction(UIAction { _ in
                
                self.addingToCart = true
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    self.addingToCart = true
                }
                
            }, for: .touchUpInside)
            
            buttonsView.addToCartButton.configurationUpdateHandler = { [unowned self] button in
                
                var config = button.configuration
                config?.showsActivityIndicator = self.addingToCart
                config?.imagePlacement = self.addingToCart ? .leading : .trailing
                config?.title = self.addingToCart ? "Adding to cart..." : "Add to cart"
                
                button.isEnabled = !self.addingToCart
                button.configuration = config
            }
            
            buttonsView.addToCartButton.configuration = config
        } else {
            // Fallback on earlier versions
        }
    }
    
    func setupAddToFavoriteButton() {
        if #available(iOS 15.0, *) {
            var config = UIButton.Configuration.filled()
            config.buttonSize = .large
            config.cornerStyle = .medium
            config.titleTextAttributesTransformer = UIConfigurationTextAttributesTransformer { incoming in
                var outgoing = incoming
                outgoing.font = UIFont.preferredFont(forTextStyle: .headline)
                return outgoing
            }
            config.image = UIImage(systemName: "heart")
            config.imagePadding = 5
            config.imagePlacement = .trailing
            config.preferredSymbolConfigurationForImage = UIImage.SymbolConfiguration(scale: .medium)
            
            buttonsView.addToCartButton.addAction(UIAction { _ in
                self.addingToFavorite = true
                
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false) { _ in
                    self.addingToFavorite = true
                }
            }, for: .touchUpInside)
            
            buttonsView.addToFavoriteButton.configurationUpdateHandler = { [unowned self] button in
                
                var config = button.configuration
                config?.showsActivityIndicator = self.addingToFavorite
                config?.imagePlacement = self.addingToFavorite ? .leading : .trailing
                config?.image = UIImage(systemName: "heart.fill")
                config?.title = self.addingToFavorite ? "Adding to favorite..." : "Add to cart"
                
                button.isEnabled = !self.addingToFavorite
                button.configuration = config
            }
            
            buttonsView.addToFavoriteButton.configuration = config
        } else {
            // Fallback on earlier versions
        }
    }
}
// MARK: - Private Handlers
//
private extension ProductDetailsViewController {
    
}
