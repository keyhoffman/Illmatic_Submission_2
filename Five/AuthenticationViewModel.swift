//
//  AuthenticationViewModel.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - AuthenticationViewModelCoordinatorDelegate

protocol AuthenticationViewModelCoordinatorDelegate: class, ErrorDelegate {
    func userHasBeenAuthenticated(user user: User)
    func navigateToLoginViewController()
}

// MARK: - AuthenticationViewModelViewDelegate

protocol AuthenticationViewModelViewDelegate: class {
    func emailIsValid()
    func passwordIsValid()
    func setLoginNavigationItem()
    func setVCTitle(title: String)
}


// MARK: - AuthenticationViewModelType

protocol AuthenticationViewModelType: class {
    var email:    String { get set }
    var password: String { get set }
    var username: String { get set }
    
    var model: AuthenticationModelType? { get set }
    
    weak var viewDelegate:        AuthenticationViewModelViewDelegate?        { get set }
    weak var coordinatorDelegate: AuthenticationViewModelCoordinatorDelegate? { get set }
    
    func navigateToLoginViewController()
    
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
            if usernameIsValid {
                if isSigningUp  { submitAuthenticationRequest() }
                if !isSigningUp { coordinatorDelegate?.anErrorHasOccured("This isnt possible") } // TODO: Move string literal elsewhere }
            }
            if !usernameIsValid { coordinatorDelegate?.anErrorHasOccured("Invalid username format") } // TODO: Move string literal elsewhere
        }
    }

    // MARK: - User Input Validation Declarations
    
    private let validPasswordCharacterCount = 5 //AuthViewModelStyleSheet.ValidPasswordCharacterCount
    private let validUsernameCharacterCount = 5 //AuthViewModelStyleSheet.ValidUsernameCharacterCount
    
    private var emailIsValid    = false
    private var passwordIsValid = false
    private var usernameIsValid = false
    
    private var canSubmitAuthenticationRequest: Bool {
        switch isSigningUp {
        case false: return emailIsValid && passwordIsValid
        case true:  return emailIsValid && passwordIsValid && usernameIsValid
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
    
    // MARK: - Authentication Submission Methods
    
    private func submitAuthenticationRequest() {
        guard let model = model where canSubmitAuthenticationRequest else {
            coordinatorDelegate?.anErrorHasOccured("Invalid Authentication Request") // TODO: Move string literal elsewhere
            return
        }
        
        if isSigningUp  { model.signUp(email: email, password: password, username: username) { self.handleAuthenticationResult($0) } }
        if !isSigningUp { model.login(email: email, password: password)                      { self.handleAuthenticationResult($0) } }
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
        return NSPredicate(format: format, arguments).evaluateWithObject(email)
    }
    
    private func validatePasswordFormat(password: String) -> Bool {
        let trimmedString = password.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
        return trimmedString.characters.count > validPasswordCharacterCount
    }
    
    private func validateUsernameFormat(username: String) -> Bool {
        return username.characters.count > validUsernameCharacterCount
    }

}









