//
//  CategoryListTests.swift
//  DokanTests
//
//  Created by heba isaa on 02/09/2022.
//
@testable import Dokan

import XCTest

class CategoryListTests: XCTestCase {

    // MARK: - Properties

    var sut: CategoryListViewController!

    // MARK: - life cycle

    override func setUpWithError() throws {
        sut = CategoryListViewController(viewModel: CategoryListViewModel())
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

    func testSUT_CanInstantiateViewController() {

        XCTAssertNotNil(sut)
    }

    func testCategoriesCollectionviewCell() {

        let expectedCell = Bundle(for: CategoryCollectionViewCell.self)
            .loadNibNamed("CategoryCollectionViewCell", owner: nil)?
            .first as! CategoryCollectionViewCell

        XCTAssertNotNil(expectedCell)
    }
}
