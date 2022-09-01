//
//  RatingDetailsViewTests.swift
//  DokanTests
//
//  Created by marwa on 31/08/2022.
//

@testable import Dokan
import XCTest

class RatingDetailsViewTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingDetailsView!

    // MARK: - life cycle

    override func setUpWithError() throws {
        sut = RatingDetailsView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testContentView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let contentView = sut.contentView
        // Then
        XCTAssertNotNil(contentView)
    }

    func testTotalReviewsNumberLabel_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let totalReviewsNumberLabel = sut.totalReviewsNumberLabel
        // Then
        XCTAssertNotNil(totalReviewsNumberLabel)
    }

    func testRatingLabel_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let ratingLabel = sut.ratingLabel
        // Then
        XCTAssertNotNil(ratingLabel)
    }

    func testFiveStarRatingView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let fiveStarRating = sut.fiveStarRating
        // Then
        XCTAssertNotNil(fiveStarRating)
    }

    func testFourStarRatingView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let fourStarRating = sut.fourStarRating
        // Then
        XCTAssertNotNil(fourStarRating)
    }

    func testThreeStarRatingView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let threeStarRating = sut.threeStarRating
        // Then
        XCTAssertNotNil(threeStarRating)
    }

    func testTwoStarRatingView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let twoStarRating = sut.twoStarRating
        // Then
        XCTAssertNotNil(twoStarRating)
    }

    func testOneStarRatingView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let oneStarRating = sut.oneStarRating
        // Then
        XCTAssertNotNil(oneStarRating)
    }

    func testRatingLabelAndTotalReviewsNumberLabel_WhenRatingDetailsHaveData_Updated() {
        // When
        sut.ratingDetails = RatingDetailsViewModel(rating: 3.4,
                                                   fiveStarNumber: 2,
                                                   fourStarNumber: 4,
                                                   threeStarNumber: 5,
                                                   twoStarNumber: 3,
                                                   oneStarNumber: 1,
                                                   totalReviewsNumber: 15)
        // Then
        XCTAssertTrue(sut.ratingLabel.text == "3.4")
        XCTAssertTrue(sut.totalReviewsNumberLabel.text == "15 Reviews")
    }
}
