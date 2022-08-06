//
//  FeaturedProductTests.swift
//  DokanTests
//
//  Created by marwa on 27/07/2022.
//

@testable import Dokan
import XCTest

class FeaturedProductTests: XCTestCase {

    // MARK: - Properties

    var sut: FeaturedProductView!

    // MARK: - life cycle

    override func setUpWithError() throws {
        sut = FeaturedProductView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - Tests

    func testFeaturedProductLabel_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let featuredProductLabel = sut.featuredProductTitle
        // Then
        XCTAssertNotNil(featuredProductLabel)
    }

    func testContentView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let contentView = sut.contentView
        // Then
        XCTAssertNotNil(contentView)
    }

    func testCollectionView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let collectionView = sut.featuredProductCollectionView
        // Then
        XCTAssertNotNil(collectionView)
    }

    func testSeeAllButton_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let seeAllButton = sut.seeAllButton
        // Then
        XCTAssertNotNil(seeAllButton)
    }

    func testSeeAllButton_WhenViewInitialized_ShouldBeAddedAsTarget() {
        // Given
        let seeAllButton = sut.seeAllButton
        // Then
        let targets = seeAllButton?.allTargets
        XCTAssertEqual(targets?.count, 1)
    }

    func testViewCollectionViewCell() {

        // Given
        guard let view = sut else {
            return XCTFail("Could not instantiate ViewController")
        }

        sut.featuredProducts = ["A", "B"] // mock [objs] from data model

        let expectedCell = Bundle(for: FeaturedProductCollectionViewCell.self)
            .loadNibNamed("FeaturedProductCollectionViewCell", owner: nil)?
            .first as! FeaturedProductCollectionViewCell

        let actualCollectionViewCell = view.featuredProductCollectionView?.dataSource?.collectionView(
            view.featuredProductCollectionView,
            cellForItemAt: IndexPath(row: 0, section: 0)
        )

        guard let actualCell = actualCollectionViewCell as? FeaturedProductCollectionViewCell else {
            XCTFail("Expected \(FeaturedProductCollectionViewCell.self), but was \(String(describing: actualCollectionViewCell))")
            return
        }

        // When
        expectedCell.productName.text = sut.featuredProducts.first as? String

        // Then
        XCTAssertEqual(actualCell.productName.text, sut.featuredProducts.first as? String)
    }
}
