//
//  SignInSigOutTests.swift
//  SignInSigOutTests
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//

import XCTest
@testable import SignInSigOut

class SignInTests: XCTestCase {

    private let loginUseCase = LogInUseCase()
    
    override func setUp() {
    }

    override func tearDown() {
    }

    func testLoginReturnNonErrorWhenAdminUserTryToLogin() {
        loginUseCase.execute(user: "admin", pass: "admin") { (error) in
            XCTAssertNil(error)
        }
    }
    
    func testLoginReturnErrorWhenNonAdminUserTryToLogin() {
        loginUseCase.execute(user: "pepe", pass: "el cojo") { (error) in
            XCTAssertNotNil(error)
        }
    }
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
