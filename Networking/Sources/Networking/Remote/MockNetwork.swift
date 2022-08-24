//
//  File.swift
//
//
//  Created by marwa on 23/08/2022.
//

import Foundation

public protocol ReviewsRemoteProtocol {
    func loadReviewProductData(completion: @escaping (Reviews?, Error?) -> Void)
}

public class MockNetwork: ReviewsRemoteProtocol {

    public init() {}

    public func loadReviewProductData(completion: @escaping (Reviews?, Error?) -> Void) {
        var Reviewsproduct: Reviews
        do {
            let allProductData = try JSONSerialization.data(withJSONObject: Constants.mockProductReviewsJsonResponse, options: .fragmentsAllowed)
            Reviewsproduct = try JSONDecoder().decode(Reviews.self, from: allProductData)
            completion(Reviewsproduct, nil)
        } catch {
            print(error.localizedDescription)
            completion(nil, error)
        }
    }
}

extension MockNetwork {

    private enum Constants {

        static let mockProductReviewsJsonResponse: [String: Any] = [
            "rating": 4.5,
            "totalRatingNumber": 12,
            "fiveStarRatingNumber": 5,
            "fourStarRatingNumber": 3,
            "threeStarRatingNumber": 1,
            "twoStarRatingNumber": 2,
            "oneStarRatingNumber": 1,
            "reviews": [
                [
                    "image": " ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 5,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": " ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 4,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": " ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 3,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": " ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 5,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": " ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 4,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": " ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 2,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": " ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 5,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": " ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 1,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": " ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 4,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": " ",
                    "name": "khaled kashmiry",
                    "date": "2021-05-17",
                    "rating": 4,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": "https://cdn.shopify.com/s/files/1/0567/9310/4582/products/c872c818621155d8fb535ee9d9c98803.jpg?v=1621288216 ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 5,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
                [
                    "image": "https://cdn.shopify.com/s/files/1/0567/9310/4582/products/ccba62c19289e4b5f14b180c05836614.jpg?v=1621288216 ",
                    "name": "yacob Jameruddin Debiza",
                    "date": "2021-05-17",
                    "rating": 3,
                    "reviewDescription": "Make a statement with these iconic Dr Marten boots. This classic style has stood the test of time thanks to the combination of reinvented styling and the rugged yet urban look. Crafted with high-quality",
                ],
            ],
        ]
    }
}
