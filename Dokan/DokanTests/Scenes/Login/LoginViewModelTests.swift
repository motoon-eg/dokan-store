//
//  Login.swift
//  DokanTests
//
//  Created by Omar Ahmed on 02/07/2022.
//

@testable import Dokan
import XCTest

class LoginViewModelTests: XCTestCase {

    // MARK: Properties

    private(set) var sut: LoginViewModel! // System Under Test

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    func testConfigureOnButtonEnabled_WhenEmailIsEmpty_ShouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        sut.configureOnButtonEnabled { isEnabled = $0 }

        // When
        sut.updateEmail("")

        // Then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNotNil(isEnabled)
    }

    func testConfigureObButtonEnabled_WhenPasswordIsEmpty_ShouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        sut.configureOnButtonEnabled { isEnabled = $0 }

        // When
        sut.updatePassword("")

        // Then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNotNil(isEnabled)
    }
}
