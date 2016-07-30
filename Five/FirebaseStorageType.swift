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
    
    static var ImageName: String { get }
}

extension FBStorageType {
    private var bucket: String { return "gs://five-dfc81.appspot.com" }
    var storageRef: FIRStorageReference { return FIRStorage.storage().referenceForURL(bucket).child(storagePath) }
    var maxSize: Int64 { return 1 * 8192 * 4096 }
}

extension FBType where Self: FBStorageType {
    func uploadToStorage(withData data: NSData, withError: NSError? -> Void) {
        storageRef.putData(data, metadata: nil) { _, error in
            if let error = error {
                print("ERROR")
                print(error.localizedDescription)
            } else {
                print("No ERROR")
            }
            performUpdatesOnMainThread {
                withError(error)
            }
        }
    }
    
    private var dataError: NSError {
        return NSError(domain: "TableBNB", code: 3, userInfo: [NSLocalizedDescriptionKey: "Invalid storage loading data for type \(Self.self)"])
    }
    
    private var imageError: NSError {
        return NSError(domain: "TableBNB", code: 3, userInfo: [NSLocalizedDescriptionKey: "Could not create image for type \(Self.self)"])
    }
    
        
    func loadImageData(withResult: Result<NSData> -> Void) {
        storageRef.dataWithMaxSize(maxSize) { data, error in
            performUpdatesOnMainThread {
                if let error = error { withResult(.Failure(error)) }
                guard let data = data else {
                    withResult(.Failure(self.dataError))
                    return
                }
                withResult(.Success(data))
            }
        }
    }
    
}