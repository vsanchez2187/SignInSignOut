//
//  LoginLogoutPresenterTest.swift
//  SignInSigOutTests
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//

import XCTest
@testable import SignInSigOut

class LoginLogoutPresenterTest: XCTestCase {
    
    private var presenter : LoginLogoutPresenter!
    private var mockUI: MockedLoginLogoutUI!
    private var timeProvider : MockedTimeProvider!
    
    override func setUp() {
        mockUI = MockedLoginLogoutUI()
        timeProvider = MockedTimeProvider(timeInterval: 2)
        presenter = LoginLogoutPresenter(ui: mockUI, loginUseCase: LogInUseCase(), logoutUseCase: LogOutUseCase(time: timeProvider))
    }
    
    func testPresenterLoginUserShowsLogoutView() {
        presenter.login(username: "admin", password: "admin")
        XCTAssertTrue(mockUI.showLogoutUICalled)
    }
    
    func testPresenterLoginUserShowsError() {
        presenter.login(username: "asdas", password: "asas")
        XCTAssertEqual(mockUI.msge, "Try to Login error")
    }
    
    func testPresenterLogoutUserShowsLoginView() {
        presenter.logout()
        XCTAssertTrue(mockUI.showLoginUICalled)
    }
    
    func testPresenterLogoutUserShowsError() {
        timeProvider.timeInterval = 3.0
        presenter.logout()
        XCTAssertEqual(mockUI.msge, "Try to Logout error")
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
