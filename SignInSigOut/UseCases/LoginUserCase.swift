//
//  LoginUserCase.swift
//  SignInSigOut
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//

import Foundation

class LogInUseCase {

    func execute(user: String, pass: String, completion: @escaping (NSError?) -> () ) {
        if user == "admin" && pass == "admin" {
            completion(nil)
        }else{
            completion(NSError(domain: "Error login user", code: -1, userInfo: [:]))
        }
    }
}
