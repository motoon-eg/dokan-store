//
//  FeaturedProductCollectionViewCellTests.swift
//  DokanTests
//
//  Created by marwa on 27/07/2022.
//

@testable import Dokan
import XCTest

class FeaturedProductCollectionViewCellTests: XCTestCase {

    // MARK: - Properties

    var sut: FeaturedProductCollectionViewCell!

    // MARK: - life cycle

    override func setUpWithError() throws {
        sut = Bundle(for: FeaturedProductCollectionViewCell.self).loadNibNamed("FeaturedProductCollectionViewCell", owner: nil)?.first as? FeaturedProductCollectionViewCell
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - Tests

    func testFeaturedProductCellProductImage_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let featuredProductCellProductImage = sut.productImage
        // Then
        XCTAssertNotNil(featuredProductCellProductImage)
    }

    func testFeaturedProductCellRateImage_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let featuredProductCellRateImage = sut.rateImage
        // Then
        XCTAssertNotNil(featuredProductCellRateImage)
    }

    func testFeaturedProductCellRateNumber_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let featuredProductCellRateNumber = sut.rateNumber
        // Then
        XCTAssertNotNil(featuredProductCellRateNumber)
    }

    func testFeaturedProductCellProductName_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let featuredProductCellProductName = sut.productName
        // Then
        XCTAssertNotNil(featuredProductCellProductName)
    }

    func testFeaturedProductCellProductPrice_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let featuredProductCellProductPrice = sut.productPrice
        // Then
        XCTAssertNotNil(featuredProductCellProductPrice)
    }

    func testFeaturedProductCellReviewsNumber_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let featuredProductCellReviewsNumber = sut.reviewsNumber
        // Then
        XCTAssertNotNil(featuredProductCellReviewsNumber)
    }

    func testFeaturedProductCellMoreButton_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let moreButton = sut.moreButton
        // Then
        XCTAssertNotNil(moreButton)
    }

    func testMoreButton_WhenViewInitialized_ShouldBeAddedAsTarget() {
        // Given
        let moreButton = sut.moreButton
        // Then
        let targets = moreButton?.allTargets
        XCTAssertEqual(targets?.count, 1)
    }
}
