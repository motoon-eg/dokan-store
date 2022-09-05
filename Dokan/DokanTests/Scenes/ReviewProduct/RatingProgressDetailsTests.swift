//
//  RatingProgressDetailsTests.swift
//  DokanTests
//
//  Created by marwa on 31/08/2022.
//
@testable import Dokan
import XCTest

class RatingProgressDetailsTests: XCTestCase {

    // MARK: - Properties

    var sut: RatingProgressDetails!

    // MARK: - life cycle

    override func setUpWithError() throws {
        try super.setUpWithError()
        sut = RatingProgressDetails()
    }

    override func tearDownWithError() throws {
        sut = nil
        try super.setUpWithError()
    }

    func testContentView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let contentView = sut.contentView

        // Then
        XCTAssertNotNil(contentView)
    }

    func testProgressBarRating_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let progressBarRating = sut.progressBarRating

        // Then
        XCTAssertNotNil(progressBarRating)
    }

    func testStarRatingView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let starRatingView = sut.starRating

        // Then
        XCTAssertNotNil(starRatingView)
    }

    func testStarsRatingLabel_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let starsRatingLabel = sut.starsRatingLabel

        // Then
        XCTAssertNotNil(starsRatingLabel)
    }

    func testRatingProgressDetailsView_WhenProgressDetailsHaveData_Updated() {
        // When
        sut.progressDetails = RatingProgressDetailsViewModel(rating: 8, starNumber: 4, totalRatingNumber: 12)

        // Then
        XCTAssertTrue(sut.starsRatingLabel.text == "8")
        XCTAssertTrue(sut.starRating.rating == 4)
        XCTAssertTrue(sut.progressBarRating.progress == (8 / 12))
    }
}
