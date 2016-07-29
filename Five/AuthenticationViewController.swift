//
//  AuthenticationViewController.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

final class AuthenticationViewController: UIViewController, UITextFieldDelegate, AuthenticationViewModelViewDelegate {
    
    // MARK: - AuthenticationViewModelType Declaration
    
    weak var viewModel: AuthenticationViewModelType? {
        didSet { viewModel?.viewDelegate = self }
    }
    
    // MARK: - UIBarButtonItem Declaration
    
    private let navigateToLoginButton = AuthViewControllerStyleSheet.BarButtonItem.NavigateToLogin.barButtonItem
    
    // MARK: - TextField Declarations
    
    let emailTextField       = AuthViewControllerStyleSheet.AuthTextField.Email.textfield
    let passwordTextField    = AuthViewControllerStyleSheet.AuthTextField.Password.textfield
    let usernameTextField    = AuthViewControllerStyleSheet.AuthTextField.Username.textfield
    let descriptionTextField = AuthViewControllerStyleSheet.AuthTextField.Description.textfield
    
    let addProfileImageFromPhotosButton = AuthViewControllerStyleSheet.AuthButton.AddImageFromPhotos.button
    let addProfileImageFromCameraButton = AuthViewControllerStyleSheet.AuthButton.AddImageFromCamera.button
    
    let imageInstructionsLabel       = AuthViewControllerStyleSheet.AuthLabel.ImageInstructions.label
    let descriptionInstructionsLabel = AuthViewControllerStyleSheet.AuthLabel.DescriptionInstructions.label
    
    let spinner = AuthViewControllerStyleSheet.AuthActivityIndicator.AuthenicationActivity.indicator
    
    // MARK: - ViewController Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setTextFieldDelegates()
        setButtonActions()
        AuthViewControllerStyleSheet.Prepare(self)
    }
    
    // MARK: - TextField Delegate Methods
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        guard let text = textField.text where !text.isEmpty else { return false }
        switch textField {
        case emailTextField:       viewModel?.email       = text
        case passwordTextField:    viewModel?.password    = text
        case usernameTextField:    viewModel?.username    = text
        case descriptionTextField: viewModel?.description = text
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
    
    func usernameIsValid() {
        emailTextField.hidden    = true
        passwordTextField.hidden = true
        usernameTextField.hidden = true
        
        usernameTextField.resignFirstResponder()

        addProfileImageFromPhotosButton.hidden = false
        addProfileImageFromCameraButton.hidden = false
        
        imageInstructionsLabel.hidden = false
    }
    
    func profileImageHasBeenSet() {
        addProfileImageFromCameraButton.hidden = true
        addProfileImageFromPhotosButton.hidden = true
        
        imageInstructionsLabel.hidden       = true
        descriptionInstructionsLabel.hidden = false
        
        descriptionTextField.becomeFirstResponder()
        
        descriptionTextField.hidden = false
    }
    
    func startActivityIndicator() {
        spinner.hidden = false
        spinner.startAnimating()
    }
    
    // MARK: - Set View Properties
    
    func setLoginNavigationItem() {
        navigationItem.rightBarButtonItem = navigateToLoginButton
    }
    
    private func setButtonActions() {
        addProfileImageFromPhotosButton.addTarget(self, action: #selector(addProfileImageFromPhotosButtonPressed), forControlEvents: .TouchUpInside)
        addProfileImageFromCameraButton.addTarget(self, action: #selector(addProfileImageFromCameraButtonPressed), forControlEvents: .TouchUpInside)
        
        navigateToLoginButton.target = self
        navigateToLoginButton.action = #selector(navigateToLoginButtonPressed)
    }
    
    func addProfileImageFromPhotosButtonPressed() {
        viewModel?.displayUserPhotos()
    }
    
    func addProfileImageFromCameraButtonPressed() {
        viewModel?.displayCamera()
    }
    
    func navigateToLoginButtonPressed() {
        viewModel?.navigateToLoginViewController()
    }
    
    func setVCTitle(title: String) {
        self.title = title
    }
    
    private func setTextFieldDelegates() {
        emailTextField.delegate       = self
        passwordTextField.delegate    = self
        usernameTextField.delegate    = self
        descriptionTextField.delegate = self
    }
}

