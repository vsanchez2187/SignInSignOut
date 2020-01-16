//
//  TimeAdapter.swift
//  SignInSigOut
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//

import Foundation

open class TimeProvider {
    
    open func now() ->Date {
        return Date()
    }
}
