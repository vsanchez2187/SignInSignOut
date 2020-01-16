//
//  ViewController.swift
//  SignInSigOut
//
//  Created by Sanchez, Vladimir on 15/01/2020.
//  Copyright © 2020 Sanchez, Vladimir. All rights reserved.
//

import UIKit

public protocol LoginLogoutUI {
    func showLoginUI()
    func showLogoutUI()
    func showError(message: String)
}

class LoginLogoutViewController: UIViewController {
    
    @IBOutlet private var userNameTextField: UITextField?
    @IBOutlet private var passwordTextField: UITextField?
    @IBOutlet private var loginButton: UIButton?
    @IBOutlet private var logoutButton: UIButton?
    
    lazy var presenter: LoginLogoutPresenter = {
        let loginUseCase = LogInUseCase()
        let logoutUseCase = LogOutUseCase(time: TimeProvider())
        return LoginLogoutPresenter(ui: self, loginUseCase: loginUseCase, logoutUseCase: logoutUseCase)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonAction() {
        presenter.login(username: userNameTextField?.text ?? "", password: passwordTextField?.text ?? "")
    }
    
    @IBAction func logoutButtonAction() {
        presenter.logout()
    }
}

extension LoginLogoutViewController: LoginLogoutUI {
    
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        present(alert, animated: true, completion: nil)
    }
    
    func showLoginUI() {
        userNameTextField?.isHidden = false
        passwordTextField?.isHidden = false
        loginButton?.isHidden = false
        logoutButton?.isHidden = true
    }
    
    func showLogoutUI() {
        userNameTextField?.isHidden = true
        passwordTextField?.isHidden = true
        loginButton?.isHidden = true
        logoutButton?.isHidden = false
    }
}

