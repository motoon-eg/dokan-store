//
//  RatingDetailsViewModelTests.swift
//  DokanTests
//
//  Created by marwa on 31/08/2022.
//
@testable import Dokan
import XCTest

class RatingDetailsViewModelTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingDetailsViewModel!

    // MARK: - life cycle

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RatingDetailsViewModel(rating: 4.3,
                                     fiveStarNumber: 6,
                                     fourStarNumber: 3,
                                     threeStarNumber: 5,
                                     twoStarNumber: 4,
                                     oneStarNumber: 2,
                                     totalReviewsNumber: 20)
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.tearDownWithError()
    }

    func testRating_WhenCallConfigureRatingLabelFunction_ReturnString() {
        // When
        let rating = sut.configureRatingLabel()

        // Then
        XCTAssertTrue(rating == "4.3")
    }

    func testTotalReviewsNumber_WhenCallConfigureTotalReviewsNumberLabelFunction_ReturnString() {
        // When
        let totalReviewsNumber = sut.configureTotalReviewsNumberLabel()

        // Then
        XCTAssertTrue(totalReviewsNumber == "20 Reviews")
    }

    func testFiveStarProgressBar_WhenCallConfigureFiveStarProgressBarFunc_ReturnRatingProgressDetailsViewModelObj() {
        // When
        let actualFiveStarProgressBar = sut.configureFiveStarProgressBar()
        let expectedFiveStarProgressBar = RatingProgressDetails.RatingProgressDetailsViewModel(rating: 6, starNumber: 5, totalRatingNumber: 20)

        // Then
        XCTAssertEqual(actualFiveStarProgressBar, expectedFiveStarProgressBar)
    }

    func testFourStarProgressBar_WhenCallConfigureFourStarProgressBarFunc_ReturnRatingProgressDetailsViewModelObj() {
        // When
        let actualFourStarProgressBar = sut.configureFourStarProgressBar()
        let expectedFourStarProgressBar = RatingProgressDetails.RatingProgressDetailsViewModel(rating: 3, starNumber: 4, totalRatingNumber: 20)

        // Then
        XCTAssertEqual(actualFourStarProgressBar, expectedFourStarProgressBar)
    }

    func testThreeStarProgressBar_WhenCallConfigureThreeStarProgressBarFunc_ReturnRatingProgressDetailsViewModelObj() {
        // When
        let actualThreeStarProgressBar = sut.configureThreeStarProgressBar()
        let expectedThreeStarProgressBar = RatingProgressDetails.RatingProgressDetailsViewModel(rating: 5, starNumber: 3, totalRatingNumber: 20)

        // Then
        XCTAssertEqual(actualThreeStarProgressBar, expectedThreeStarProgressBar)
    }

    func testTwoStarProgressBar_WhenCallConfigureTwoStarProgressBarFunc_ReturnRatingProgressDetailsViewModelObj() {
        // When
        let actualTwoStarProgressBar = sut.configureTwoStarProgressBar()
        let expectedTwoStarProgressBar = RatingProgressDetails.RatingProgressDetailsViewModel(rating: 4, starNumber: 2, totalRatingNumber: 20)

        // Then
        XCTAssertEqual(actualTwoStarProgressBar, expectedTwoStarProgressBar)
    }

    func testOneStarProgressBar_WhenCallConfigureOneStarProgressBarFunc_ReturnRatingProgressDetailsViewModelObj() {
        // When
        let actualOneStarProgressBar = sut.configureOneStarProgressBar()
        let expectedOneStarProgressBar = RatingProgressDetails.RatingProgressDetailsViewModel(rating: 2, starNumber: 1, totalRatingNumber: 20)

        // Then
        XCTAssertEqual(actualOneStarProgressBar, expectedOneStarProgressBar)
    }
}
