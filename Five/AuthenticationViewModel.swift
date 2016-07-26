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
    func navigateToLoginButtonPressed()
}

// MARK: - AuthenticationViewModelViewDelegate

protocol AuthenticationViewModelViewDelegate: class {
    func emailIsValid()
    func passwordIsValid()
    func setLoginNavigationItem()
    func setVCTitle(title: String)
}


//MARK: - AuthenticationViewModelType

protocol AuthenticationViewModelType: class {
    
    var email:    String { get set }
    var password: String { get set }
    var username: String { get set }
    
    weak var viewDelegate:        AuthenticationViewModelViewDelegate?        { get set }
    weak var coordinatorDelegate: AuthenticationViewModelCoordinatorDelegate? { get set }
    weak var model:               AuthenticationModelType?                    { get set }
    
    func navigateToLogin()
}

class AuthenticationViewModel: AuthenticationViewModelType {
    
    weak var viewDelegate:        AuthenticationViewModelViewDelegate?
    weak var coordinatorDelegate: AuthenticationViewModelCoordinatorDelegate?
    weak var model:               AuthenticationModelType?
    
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
    
    let validPasswordCharacterCount = 5 //AuthViewModelStyleSheet.ValidPasswordCharacterCount
    let validUsernameCharacterCount = 5 //AuthViewModelStyleSheet.ValidUsernameCharacterCount
    
    var emailIsValid    = false
    var passwordIsValid = false
    var usernameIsValid = false
    
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

    
    func navigateToLogin() {
        
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
        case .Failure(let error): self.coordinatorDelegate?.anErrorHasOccured(error._domain)
        case .Success(let user):  self.coordinatorDelegate?.userHasBeenAuthenticated(user: user)
        }
    }
    
    // MARK: - User Input Validation Methods
    
    private func validateEmailFormat(email: String) -> Bool {
        let format    = "SELF MATCHES %@"
        let arguments = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,32}"
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









