//
//  LoginViewModelTests.swift
//  DokanTests
//
//  Created by Ahmed M. Hassan on 01/07/2022.
//

import XCTest

@testable import Dokan

final class LoginViewModelTests: XCTestCase {

    // MARK: Properties
    
    var sut: LoginViewModel! // System Under Test
    
    // MARK: - Lifecycle
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = LoginViewModel()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
    }

    // MARK: - Tests
    
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
        var isEnabled: Bool?
        sut.configureOnButtonEnabled { isEnabled = $0 }
        
        // When
        sut.updatePassword("")
        
        // Then
        XCTAssertTrue(isEnabled == false)
        XCTAssertNotNil(isEnabled)
    }
}
