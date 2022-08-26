//
//  ProductDetailsViewModel.swift
//  Dokan
//
//  Created by Ahmed M. Hassan on 15/07/2022.
//

import Foundation
import Domain

// MARK: ProductDetailsViewModel

class ProductDetailsViewModel {
    
    
    let repository: ProductRepository
    
    init(repository: ProductRepository = ServiceLocator.provider.makeProductRepository()) {
        self.repository = repository
    }
    
}

// MARK: ProductDetailsViewModel

extension ProductDetailsViewModel: ProductDetailsViewModelInput {}

// MARK: ProductDetailsViewModelOutput

extension ProductDetailsViewModel: ProductDetailsViewModelOutput {
    
    func loadProduct(productID: Int, completion: @escaping (Product) -> Void) {
        repository.loadSingleProduct(productID: productID) { result in
            switch result {
                
            case .success(let product):
                completion(product)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

// MARK: Private Handlers

private extension ProductDetailsViewModel {}
