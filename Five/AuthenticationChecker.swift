//
//  AuthenticationChecker.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

protocol AuthenticationChecker {}

extension AuthenticationChecker {
    func checkForCurrentUser() -> User? {
        let auth = FIRAuth.auth()
        guard let key = auth?.currentUser?.uid, email = auth?.currentUser?.email, username = auth?.currentUser?.displayName  else { return nil }
        return User(key: key, email: email, username: username)
    }
}