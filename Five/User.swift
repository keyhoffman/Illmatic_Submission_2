//
//  User.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

struct User: FBType, FBStorageType {
    let key:           String
    let email:         String
    let username:      String
    let description:   String
    let storagePath:   String
}

// MARK: - User Extension

extension User {
    static let Path         = "users/"
    static let NeedsAutoKey = false
    static let FBSubKeys    = ["username", "email", "rating", "description", "storagePath"]
    static let ImageName    = "/profileImage.png"
}

// MARK: - User "createNew" Initializer Extension
// FIXME: - Change FBDict keys from string literals

extension User {
    static func Create(FBDict: FBDictionary?) -> Result<User> {
        guard let email =  FBDict?["email"] >>> FBString, let username = FBDict?["username"] >>> FBString, let key = FBDict?["key"] >>> FBString,
            let description = FBDict?["description"] >>> FBString, let storagePath = FBDict?["storagePath"] >>> FBString else {
                return .Failure(instantiationError)
        }
        
        return .Success(User(key: key, email: email, username: username, description: description, storagePath: storagePath))
    }
}

// MARK: - User Equatability

func == (lhs: User, rhs: User) -> Bool {
    return lhs.key == rhs.key 
}



