//
//  Dumpable.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - Dumpable Protocol

protocol Dumpable {}

// MARK: - Dumpable Protocol Extension

extension Dumpable {
    func dump_() {
        print("----- \(Self.self) Dump -----")
        dump(self)
    }
    
    func dumpWithSize() {
        dump_()
        print("Size == \(sizeof(Self))")
    }
    
    func dump_(withContext context: String) {
        print("----- \(context) -----")
        dump_()
    }
    
}
