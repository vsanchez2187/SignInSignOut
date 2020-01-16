//
//  LoginLogoutMockUI.swift
//  SignInSigOutTests
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//
import Foundation
@testable import SignInSigOut

class MockedLoginLogoutUI: LoginLogoutUI  {
    
    var showLoginUICalled = false
    var showLogoutUICalled = false
    var msge: String?  = nil
    
    func showLoginUI() {
        showLoginUICalled = true
    }
    
    func showLogoutUI() {
        showLogoutUICalled = true
    }
    
    func showError(message: String) {
        msge = message
    }
}
