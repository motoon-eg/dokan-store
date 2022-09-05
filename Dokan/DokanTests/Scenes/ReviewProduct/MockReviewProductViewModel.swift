//
//  MockReviewProductViewModel.swift
//  DokanTests
//
//  Created by marwa on 04/09/2022.
//

@testable import Dokan
import Foundation
@testable import Networking

class MockReviewProductViewModel {

    var shouldReturnError: Bool
    let viewModel = ReviewProductViewModel()

    init(shouldReturnError: Bool) {

        self.shouldReturnError = shouldReturnError
    }

    public func loadReviews() {
        viewModel.state = .loading
        do {
            let allProductData = try JSONSerialization.data(withJSONObject: mockProductReviewsJsonResponse, options: .fragmentsAllowed)
            let _ = try JSONDecoder().decode(Networking.Reviews.self, from: allProductData)
            viewModel.state = .loaded
        } catch {
            viewModel.state = .error
        }
        if shouldReturnError {
            viewModel.state = .error

        } else {
            viewModel.state = .loaded
        }
    }

    let mockProductReviewsJsonResponse: [String: Any] = [
        "rating": 4.5,
        "totalRatingNumber": 12,
        "fiveStarRatingNumber": 5,
        "fourStarRatingNumber": 3,
        "threeStarRatingNumber": 1,
        "twoStarRatingNumber": 2,
        "oneStarRatingNumber": 1,
        "reviews": [
            [
                "image": "https://images.pexels.com/photos/39866/entrepreneur-startup-start-up-man-39866.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                "name": "yacob Jameruddin Debiza",
                "date": "2021-05-17",
                "rating": 5,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination.Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination.Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination.Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination.Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination.",
            ],
            [
                "image": "https://images.pexels.com/photos/2050994/pexels-photo-2050994.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                "name": "khaled kashmiry",
                "date": "2021-05-17",
                "rating": 3,
                "reviewDescription": "Make a statement with these iconic Dr Marten.",
            ],
            [
                "image": "https://images.pexels.com/photos/445109/pexels-photo-445109.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                "name": "khadir karawita",
                "date": "2021-05-17",
                "rating": 4,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination.Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination.statement with these iconic Dr Marten boots.",
            ],
            [
                "image": "https://images.pexels.com/photos/762080/pexels-photo-762080.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                "name": "Mohamed Simbel",
                "date": "2021-05-17",
                "rating": 2,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
            ],
            [
                "image": "https://images.pexels.com/photos/247304/pexels-photo-247304.jpeg?auto=compress&cs=tinysrgb&w=600",
                "name": "Ismail Shesha",
                "date": "2021-05-17",
                "rating": 5,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
            ],
            [
                "image": "https://images.pexels.com/photos/1848565/pexels-photo-1848565.jpeg?auto=compress&cs=tinysrgb&w=600",
                "name": "yacob Jameruddin Debiza",
                "date": "2021-05-17",
                "rating": 4,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
            ],
            [
                "image": "https://images.pexels.com/photos/886285/pexels-photo-886285.jpeg?auto=compress&cs=tinysrgb&w=600",
                "name": "Mohamed Simbel",
                "date": "2021-05-17",
                "rating": 5,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented",
            ],
            [
                "image": "https://images.pexels.com/photos/354951/pexels-photo-354951.jpeg?auto=compress&cs=tinysrgb&w=600",
                "name": "Ismail Shesha",
                "date": "2021-05-17",
                "rating": 1,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
            ],
            [
                "image": "https://images.pexels.com/photos/415263/pexels-photo-415263.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                "name": "khadir karawita",
                "date": "2021-05-17",
                "rating": 4,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
            ],
            [
                "image": "https://images.pexels.com/photos/1019771/pexels-photo-1019771.jpeg?auto=compress&cs=tinysrgb&w=600",
                "name": "khaled kashmiry",
                "date": "2021-05-17",
                "rating": 4,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
            ],
            [
                "image": "https://images.pexels.com/photos/2216350/pexels-photo-2216350.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
                "name": "yacob Jameruddin Debiza",
                "date": "2021-05-17",
                "rating": 5,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
            ],
            [
                "image": "https://images.pexels.com/photos/1055691/pexels-photo-1055691.jpeg?auto=compress&cs=tinysrgb&w=600",
                "name": "Mohamed Simbel",
                "date": "2021-05-17",
                "rating": 3,
                "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
            ],
        ],
    ]
}
