//
//  FirebaseType.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

import Firebase

// MARK: - FBDictionary

typealias FBDictionary = [String : AnyObject]

// MARK: - FirebaseType Protocol

protocol FBType: Equatable, Dumpable {
    var key: String { get }
    
    static var Path: String          { get }
    static var NeedsAutoKey: Bool    { get }
    static var FBSubKeys:   [String] { get }
    
    static func Create(FBDict: FBDictionary?) -> Result<Self>

}

// MARK: - FirebaseType Protocol Extension

extension FBType {
    static var RootRef: FIRDatabaseReference { return FIRDatabase.database().reference() }


    private var sendingError: NSError { // TODO: Move this elsewhere
        return NSError(domain: "TableBNB", code: 1, userInfo: [NSLocalizedDescriptionKey: "Could not convert \(Self.self) to FBDictionary"])
    }
    
    static var instantiationError: NSError {
        return NSError(domain: "TableBNB", code: 2, userInfo: [NSLocalizedDescriptionKey: "Could not instantiate \(Self.self)"])
    }
    
    func sendToFB(withResult: Result<Self> -> Void) {
        guard let FBDict = convertToFBSendable() else {
            withResult(.Failure(sendingError))
            return
        }
        FBDict.dump_()
        let path = Self.NeedsAutoKey ? Self.Path + autoKey : Self.Path + key
        print("path = \(path)")
        Self.RootRef.child(path).setValue(FBDict) { error, _ in
            if let error = error {
                withResult(.Failure(error))
                return
            }
            withResult(.Success(self))
        }
    }
    
    private var autoKey: String { return Self.RootRef.childByAutoId().key }
    
    private func convertToFBSendable() -> FBDictionary? {
        var FBDict: FBDictionary = [:]
        let mirror = Mirror(reflecting: self)
        for case let (label?, value) in mirror.children {
            print("label = \(label), value = \(value)")
            print("value subjectType = \(Mirror(reflecting: value).subjectType)")
            FBDict[label] = value as? AnyObject
        }
        return Dictionary(FBDict.filter { Self.FBSubKeys.contains($0.0) })
    }


}
