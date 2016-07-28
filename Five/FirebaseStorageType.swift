//
//  FirebaseStorageType.swift
//  Five
//
//  Created by Key Hoffman on 7/28/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import Firebase

protocol FBStorageType {
    var storagePath: String { get }
}

extension FBStorageType {
    private var bucket: String { return "gs://five-dfc81.appspot.com" }
    var storageRef: FIRStorageReference { return FIRStorage.storage().referenceForURL(bucket).child(storagePath) }
    var maxSize: Int64 { return 1 * 1024 * 1024 }
}

extension FBType where Self: FBStorageType {
    func uploadToStorage(withData data: NSData, withError: NSError? -> Void) {
        storageRef.putData(data, metadata: nil) { _, error in
            withError(error)
        }
    }
}