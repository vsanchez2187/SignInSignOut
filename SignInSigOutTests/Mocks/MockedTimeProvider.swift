//
//  MockedTimeProvider.swift
//  SignInSigOutTests
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//

import Foundation
@testable import SignInSigOut

class MockedTimeProvider: TimeProvider {

    var timeInterval:Double
    
    init(timeInterval:Double ) {
        self.timeInterval = timeInterval
    }
    
    override func now() -> Date {
        return Date(timeIntervalSince1970: timeInterval)
    }
}
