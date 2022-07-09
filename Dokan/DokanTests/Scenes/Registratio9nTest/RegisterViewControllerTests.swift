//
//  RegisterViewControllerTests.swift
//  DokanTests
//
//  Created by heba isaa on 05/07/2022.
//

import XCTest
@testable import Dokan


class RegisterViewControllerTests: XCTestCase {
    // MARK: - Properties

    var sut: RegisterViewModel!
    
    // MARK: - life cycle

    override func setUpWithError() throws {
        sut = RegisterViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    // MARK: - Tests
    
    func testConfigureIsButtonEnabled_WhenEmailOrPhoneIsEmpty_ShouldBeDisabled() {
        // Given
        var isEnabled: Bool?
        sut.ConfigureButtonEnabled { _isEnabled in
            isEnabled = _isEnabled
        }

        // When
        sut.updatePhoneOrEmail(input: "hebaaisaa2000@gmail.com")

        // Then
        XCTAssertTrue(isEnabled == true)
    }
}
