//
//  ReviewProductViewControllerTests.swift
//  DokanTests
//
//  Created by marwa on 31/08/2022.
//

@testable import Dokan
import Domain
import Network
import XCTest

class ReviewProductViewControllerTests: XCTestCase {
    // MARK: - Properties

    var sut: ReviewProductViewController!
    var viewModel: ReviewProductViewModel!
    var mockViewModel: MockReviewProductViewModel!

    // MARK: - life cycle

    override func setUpWithError() throws {
        try super.setUpWithError()
        viewModel = ReviewProductViewModel()
        mockViewModel = MockReviewProductViewModel(shouldReturnError: false)
        sut = ReviewProductViewController(viewModel: viewModel)
        sut.loadViewIfNeeded()
    }

    override func tearDownWithError() throws {
        sut = nil
        viewModel = nil
        mockViewModel = nil
        try super.tearDownWithError()
    }

    func testReviewProductTableView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let reviewProductTableView = sut.reviewProductTableView

        // Then
        XCTAssertNotNil(reviewProductTableView)
    }

    func testRatingDetailsView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let ratingDetailsView = sut.ratingDetailsView

        // Then
        XCTAssertNotNil(ratingDetailsView)
    }

    func testMainStackView_WhenViewIsLoaded_OutletIsLinked() {
        // Given
        let mainStackView = sut.mainStackView

        // Then
        XCTAssertNotNil(mainStackView)
    }

    func testFirstRow_WhenLoadData_IsVisible() {
        // Given
        let tableView = sut.reviewProductTableView

        // When
        mockViewModel.loadReviews()
        tableView?.reloadData()

        // Then
        let indexPath0 = IndexPath(item: 0, section: 0)
        let cell0 = tableView!.cellForRow(at: indexPath0)
        let visibleRows = tableView?.indexPathsForVisibleRows
        XCTAssert(visibleRows != nil)
        XCTAssertTrue((tableView?.indexPathsForVisibleRows!.contains(indexPath0)) != nil)
        XCTAssert(cell0 != nil)
    }

    func testMainStackView_WhenStateIsLoading_IsVisible() {
        // Given
        let state = viewModel.state

        // When
        XCTAssertTrue(state == State.loading)

        // Then
        XCTAssertFalse(sut.mainStackView.isHidden)
    }

    func testMainStackView_WhenStateIsLoading_IsSkeletonActive() {
        // Given
        let state = viewModel.state

        // When
        XCTAssertTrue(state == State.loading)

        // Then
        XCTAssertTrue(sut.mainStackView.sk.isSkeletonActive)
    }

    func testMainStackView_WhenStateIsLoaded_IsVisible() {

        let expecttionObj = expectation(description: "Wait for response")
        // When
        mockViewModel.loadReviews()
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            expecttionObj.fulfill()
        }
        waitForExpectations(timeout: 10)
        let state = viewModel.state

        // Then
        XCTAssertTrue(state == State.loaded)
        XCTAssertFalse(sut.mainStackView.isHidden)
    }

    func testMainStackView_WhenStateIsLoaded_IsSkeletonInActive() {
        let expecttionObj = expectation(description: "Wait for response")

        // When
        mockViewModel.loadReviews()
        DispatchQueue.main.asyncAfter(deadline: .now() + 10) {
            expecttionObj.fulfill()
        }
        waitForExpectations(timeout: 10)
        let state = viewModel.state

        // Then
        XCTAssertTrue(state == State.loaded)
        XCTAssertFalse(sut.mainStackView.sk.isSkeletonActive)
    }
}
