//
//  AuthenticationViewModel.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

// MARK: - AuthenticationViewModelCoordinatorDelegate

protocol AuthenticationViewModelCoordinatorDelegate: class, ErrorDelegate {
    func userHasBeenAuthenticated(user user: User)
    func navigateToLoginViewController()
    func displayUserPhotos()
    func displayCamera()
}

// MARK: - AuthenticationViewModelViewDelegate

protocol AuthenticationViewModelViewDelegate: class {
    func emailIsValid()
    func passwordIsValid()
    func usernameIsValid()
    func profileImageHasBeenSet()
    func setLoginNavigationItem()
    func setVCTitle(title: String)
    func startActivityIndicator()
}


// MARK: - AuthenticationViewModelType

protocol AuthenticationViewModelType: class {
    var email:       String { get set }
    var password:    String { get set }
    var username:    String { get set }
    var description: String { get set }
    
    var profileImageData: NSData? { get set }
    
    var model: AuthenticationModelType? { get set }
    
    weak var viewDelegate:        AuthenticationViewModelViewDelegate?        { get set }
    weak var coordinatorDelegate: AuthenticationViewModelCoordinatorDelegate? { get set }
    
    func navigateToLoginViewController()
    func displayUserPhotos()
    func displayCamera()
    
    init(isSigningUp: Bool)
}

// MARK: - AuthenticationViewModel

final class AuthenticationViewModel: AuthenticationViewModelType {

    var model: AuthenticationModelType?
    
    weak var coordinatorDelegate: AuthenticationViewModelCoordinatorDelegate?
    weak var viewDelegate:        AuthenticationViewModelViewDelegate? {
        didSet {
            switch isSigningUp {
            case false: viewDelegate?.setVCTitle(AuthViewControllerStyleSheet.LoginTitle)
            case true:  viewDelegate?.setVCTitle(AuthViewControllerStyleSheet.SignUpTitle)
                        viewDelegate?.setLoginNavigationItem()
            }
        }
        
    }
    
    var email: String = .emptyString() {
        didSet {
            emailIsValid = validateEmailFormat(email)
            if emailIsValid  { viewDelegate?.emailIsValid() }
            if !emailIsValid { coordinatorDelegate?.anErrorHasOccured("Invalid email format") } // TODO: Move string literal elsewhere }
        }
    }
    
    var password: String = .emptyString() {
        didSet {
            passwordIsValid = validatePasswordFormat(password)
            if passwordIsValid {
                if isSigningUp  { viewDelegate?.passwordIsValid() }
                if !isSigningUp { submitAuthenticationRequest() }
            }
            if !passwordIsValid { coordinatorDelegate?.anErrorHasOccured("Invalid password format") } // TODO: Move string literal elsewhere
        }
    }
    
    var username: String = .emptyString() {
        didSet {
            usernameIsValid = validateUsernameFormat(username)
            if usernameIsValid && isSigningUp   { viewDelegate?.usernameIsValid() }
            if !usernameIsValid || !isSigningUp { coordinatorDelegate?.anErrorHasOccured("Invalid username format") } // TODO: Move string literal elsewhere
        }
    }
    
    var description: String = .emptyString() {
        didSet {
            descriptionIsValid = validateDescriptionFormat(description)
            if descriptionIsValid && isSigningUp   { submitAuthenticationRequest() }
            if !descriptionIsValid || !isSigningUp { coordinatorDelegate?.anErrorHasOccured("That is boring. Enter something more interesting!") } // TODO: Move string literal elsewhere
        }
    }
    
    var profileImageData: NSData? {
        didSet { viewDelegate?.profileImageHasBeenSet() }
    }
    // MARK: - User Input Validation Declarations

    private var emailIsValid       = false
    private var passwordIsValid    = false
    private var usernameIsValid    = false
    private var descriptionIsValid = false
    
    private var canSubmitAuthenticationRequest: Bool {
        switch isSigningUp {
        case false: return emailIsValid && passwordIsValid
        case true:  return emailIsValid && passwordIsValid && usernameIsValid && descriptionIsValid && profileImageData != nil
        }
    }


    // MARK: - Authentication Action Declaration
    
    private let isSigningUp: Bool
    
    init(isSigningUp: Bool) {
        self.isSigningUp = isSigningUp
    }

    
    func navigateToLoginViewController() {
        coordinatorDelegate?.navigateToLoginViewController()
    }
    
    func displayUserPhotos() {
        coordinatorDelegate?.displayUserPhotos()
    }
    
    func displayCamera() {
        coordinatorDelegate?.displayCamera()
    }
    
    // MARK: - Authentication Submission Methods
    
    private func submitAuthenticationRequest() {
        guard let model = model where canSubmitAuthenticationRequest else {
            coordinatorDelegate?.anErrorHasOccured("Invalid Authentication Request") // TODO: Move string literal elsewhere
            return
        }
        
        viewDelegate?.startActivityIndicator()
        
        if isSigningUp  { guard let imageData = profileImageData else {
                coordinatorDelegate?.anErrorHasOccured("Invalid image data")
                return
            }
            model.signUp(email: email, password: password, username: username, description: description, imageData: imageData) { self.handleAuthenticationResult($0) }
        }
        if !isSigningUp { model.login(email: email, password: password) { self.handleAuthenticationResult($0) } }
    }
    
    private func handleAuthenticationResult(result: Result<User>) {
        switch result {
        case .Failure(let error): self.coordinatorDelegate?.anErrorHasOccured(error.localizedDescription)
        case .Success(let user):  self.coordinatorDelegate?.userHasBeenAuthenticated(user: user)
        }
    }
    
    // MARK: - User Input Validation Methods
    
    private func validateEmailFormat(email: String) -> Bool {
        let format    = AuthViewControllerStyleSheet.ValidEmailPredicateFormat
        let arguments = AuthViewControllerStyleSheet.ValidEmailPredicateArguments
        return NSPredicate(format: format, arguments).evaluateWithObject(email) && email.characters.count > AuthViewControllerStyleSheet.ValidEmailCharacterCount
    }
    
    private func validatePasswordFormat(password: String) -> Bool {
        let trimmedString = password.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
        return trimmedString.characters.count > AuthViewControllerStyleSheet.ValidPasswordCharacterCount
    }
    
    private func validateUsernameFormat(username: String) -> Bool {
        return username.characters.count > AuthViewControllerStyleSheet.ValidUsernameCharacterCount
    }
    
    private func validateDescriptionFormat(description: String) -> Bool {
        return description.characters.count > AuthViewControllerStyleSheet.ValidDescriptionCharacterCount
    }

}









