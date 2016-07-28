//
//  AuthenticationViewController.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

final class AuthenticationViewController: UIViewController, UITextFieldDelegate, AuthenticationViewModelViewDelegate {
    
    // MARK: - AuthenticationViewModelType Declaration
    
    weak var viewModel: AuthenticationViewModelType? {
        didSet { viewModel?.viewDelegate = self }
    }
    
    // MARK: - UIBarButtonItem Declaration
    
    private let navigateToLoginButton = AuthViewControllerStyleSheet.BarButtonItem.NavigateToLogin.barButtonItem
    
    // MARK: - TextField Declarations
    
    let emailTextField    = AuthViewControllerStyleSheet.AuthTextField.Email.textfield
    let passwordTextField = AuthViewControllerStyleSheet.AuthTextField.Password.textfield
    let usernameTextField = AuthViewControllerStyleSheet.AuthTextField.Username.textfield
    
    let addProfileImageButton = AuthViewControllerStyleSheet.AuthButton.AddProfileImage.button
    
    // MARK: - ViewController Lifecycle
    // TODO:   Add A Prepare Method!!!!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegates()
        AuthViewControllerStyleSheet.Prepare(self)
    }
    
    // MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        guard let text = textField.text where !text.isEmpty else { return false }
        switch textField {
        case emailTextField:    viewModel?.email    = text
        case passwordTextField: viewModel?.password = text
        case usernameTextField: viewModel?.username = text
        default: fatalError("Invalid textfield")
        }
        return true
    }
    
    // MARK: - AuthenticationViewModelViewDelegate Methods
    
    func emailIsValid() {
        emailTextField.resignFirstResponder()
        passwordTextField.becomeFirstResponder()
        passwordTextField.hidden = false
    }
    
    func passwordIsValid() {
        passwordTextField.resignFirstResponder()
        usernameTextField.becomeFirstResponder()
        usernameTextField.hidden = false
    }
    
    // MARK: - Set View Properties
    
    func setLoginNavigationItem() {
        navigateToLoginButton.target = self
        navigateToLoginButton.action = #selector(navigateToLoginButtonPressed)
        navigationItem.rightBarButtonItem = navigateToLoginButton
    }
    
    func navigateToLoginButtonPressed() {
        viewModel?.navigateToLoginViewController()
    }
    
    func setVCTitle(title: String) {
        self.title = title
    }
    
    private func setTextFieldDelegates() {
        emailTextField.delegate    = self
        passwordTextField.delegate = self
        usernameTextField.delegate = self
    }
}

