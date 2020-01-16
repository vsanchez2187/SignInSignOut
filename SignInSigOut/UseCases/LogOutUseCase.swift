//
//  LogoutUseCase.swift
//  SignInSigOut
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//
import Foundation

class LogOutUseCase {
    
    private let time: TimeProvider
    
    init(time: TimeProvider) {
        self.time = time
    }
    
    func execute(completion: @escaping (NSError?) -> ()){
        if Int(time.now().timeIntervalSince1970) % 2 == 0 {
            completion(nil)
        }else {
            completion(NSError(domain:"Logout Error", code: -1, userInfo: [:]))
        }
    }
}
