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
    func signUp(email email: String, password: String, username: String, description: String, imageData data: NSData, withResult: Result<User> -> Void)
}


// MARK: - AuthenticationModel

struct AuthenticationModel: AuthenticationModelType {
    
    typealias UserResultBlock = Result<User> -> Void
    
    // MARK: AuthenticationModelProtocol Required Methods
    
    func login(email email: String, password: String, withResult: UserResultBlock) {
        FIRAuth.auth()?.signInWithEmail(email, password: password) { loggedInUser, error in
            if let error = error {
                withResult(.Failure(error))
                return
            }
            guard let uid = loggedInUser?.uid else { return }
            User.loadValue(withKey: uid, forType: User.self) { withResult($0) }
        }
        
    }
    
    func signUp(email email: String, password: String, username: String, description: String, imageData data: NSData, withResult: UserResultBlock) {
        FIRAuth.auth()?.createUserWithEmail(email, password: password) { newUser, error in
            if let error = error {
                withResult(.Failure(error))
                return
            }
            guard let newUser = newUser, email = newUser.email else { return }
            let imagePath = newUser.uid + User.ImageName
            let user = User(key: newUser.uid, email: email, username: username, description: description, storagePath: imagePath)
            user.uploadToStorage(withData: data) { error in
                if let error = error {
                    withResult(.Failure(error))
                }
                user.sendToFB { withResult($0) }
            }
        }
    }
}


//guard let user = user else { // TODO: Move string literal elsewhere
//    let error = NSError(domain: "TableBNB", code: 1, userInfo: [NSLocalizedDescriptionKey: "Could not create atomic user"])
//    withResult(.Failure(error))
//    return
//}





//            guard let user = user, let email = user.email, let username = user.displayName else { // TODO: Move string literal elsewhere
//                let error = NSError(domain: "TableBNB", code: 1, userInfo: [NSLocalizedDescriptionKey: "Could not create atomic user"])
//                withResult(.Failure(error))
//                return
//            }
//            let loggedInUser = User(key: user.uid, email: email, username: username, description: .emptyString())
//            withResult(.Success(loggedInUser))



