//
//  LogoutTest.swift
//  SignInSigOutTests
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//

import XCTest
@testable import SignInSigOut

class LogoutTest: XCTestCase {
    
    private var timeProvider: MockedTimeProvider!
    private var logoutUseCase: LogOutUseCase!
    
    override func setUp() {
        self.timeProvider = MockedTimeProvider(timeInterval: 3.0)
        self.logoutUseCase = LogOutUseCase(time: timeProvider)
    }
    
    override func tearDown() {
    }
    
    func testLogoutReturnAnErrorIfTimeIsNotOdd() {
        logoutUseCase.execute { (error) in
            XCTAssertNotNil(error)
        }
    }
    
    func testLogoutReturnNoErrorIfTimeIsOdd() {
        timeProvider.timeInterval = 2.0
        logoutUseCase.execute { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
