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
    func checkForCurrentUser(withResult: Result<User> -> Void) {
        let error = NSError(domain: "Five", code: 2, userInfo: [NSLocalizedDescriptionKey: "No user found"])
        let auth = FIRAuth.auth()
        guard let key = auth?.currentUser?.uid else {
            withResult(.Failure(error))
            return
        }
        User.loadValue(withKey: key, forType: User.self) { withResult($0) }
    }
    
}