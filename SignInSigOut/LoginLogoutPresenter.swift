//
//  LoginLogoutPresenter.swift
//  SignInSigOut
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//

class LoginLogoutPresenter {
    
    private let ui: LoginLogoutUI
    private let loginUseCase: LogInUseCase
    private let logoutUseCase: LogOutUseCase
    
    init(ui: LoginLogoutUI, loginUseCase: LogInUseCase, logoutUseCase: LogOutUseCase) {
        self.ui = ui
        self.loginUseCase = loginUseCase
        self.logoutUseCase = logoutUseCase
    }
    
    func viewDidLoad(){
       self.ui.showLoginUI()
    }
    
    public func login(username: String, password: String){
        loginUseCase.execute(user: username, pass: password) { (error) in
            if let _ = error {
                self.ui.showError(message: "Try to Login error")
            }else {
                self.ui.showLogoutUI()
            }
        }
    }
    
    public func logout(){
        logoutUseCase.execute { (error) in
            if let _ = error {
                self.ui.showError(message: "Try to Logout error")
            }else {
                self.ui.showLoginUI()
            }
        }
    }
    
}
