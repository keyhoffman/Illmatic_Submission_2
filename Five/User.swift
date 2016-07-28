//
//  User.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

struct User: FBType {
    let key:         String
    let email:       String
    let username:    String
    let description: String
}

// MARK: - User Extension

extension User {
    static let Path         = "users/"
    static let NeedsAutoKey = false
    static let FBSubKeys    = ["username", "email", "rating", "description"]
}

// MARK: - User "createNew" Initializer Extension
// FIXME: - Change FBDict keys from string literals

extension User {
    static func Create(FBDict: FBDictionary?) -> Result<User> {
        guard let email = FBDict?["email"] as? String, let username = FBDict?["username"] as? String, let key = FBDict?["key"] as? String,
            let description = FBDict?["description"] as? String else { return .Failure(instantiationError) }
        
        return .Success(User(key: key, email: email, username: username, description: description))
    }
}

// MARK: - User Equatability

func == (lhs: User, rhs: User) -> Bool {
    return lhs.key == rhs.key && lhs.username == rhs.username && lhs.email == rhs.email
}