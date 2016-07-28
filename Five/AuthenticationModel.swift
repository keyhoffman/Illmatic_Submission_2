//
//  AuthenticationModel.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

// MARK: - AuthenticationModelProtocol

protocol AuthenticationModelType {
    func login(email email: String, password: String, withResult: Result<User> -> Void)
    func signUp(email email: String, password: String, username: String, withResult: Result<User> -> Void)
}


// MARK: - AuthenticationModel

struct AuthenticationModel: AuthenticationModelType {
    
    typealias UserResultBlock = Result<User> -> Void
    
    // MARK: AuthenticationModelProtocol Required Methods
    
    func login(email email: String, password: String, withResult: UserResultBlock) {
        FIRAuth.auth()?.signInWithEmail(email, password: password) { user, error in
            if let error = error {
                withResult(.Failure(error))
                return
            }
            guard let user = user, let email = user.email, let username = user.displayName else { // TODO: Move string literal elsewhere
                let error = NSError(domain: "TableBNB", code: 1, userInfo: [NSLocalizedDescriptionKey: "Could not create atomic user"])
                withResult(.Failure(error))
                return
            }
            let loggedInUser = User(key: user.uid, email: email, username: username)
            withResult(.Success(loggedInUser))
        }
        
    }
    
    func signUp(email email: String, password: String, username: String, withResult: UserResultBlock) {
        FIRAuth.auth()?.createUserWithEmail(email, password: password) { user, error in
            if let error = error {
                withResult(.Failure(error))
                return
            }
            guard let user = user else { // TODO: Move string literal elsewhere
                let error = NSError(domain: "TableBNB", code: 1, userInfo: [NSLocalizedDescriptionKey: "Could not create atomic user"])
                withResult(.Failure(error))
                return
            }
            let changeRequest = user.profileChangeRequest()
            changeRequest.displayName = username
            changeRequest.commitChangesWithCompletion { error in
                if let error = error {
                    withResult(.Failure(error))
                    return
                }
                let logggedInUser = User(key: user.uid, email: email, username: username)
                logggedInUser.sendToFB { result in
                    withResult(result)
                }
            }
        }
    }
}