//
//  Coordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - Coordinator Protocol
/**
 The basic behavior that any coordinator needs to implement.
 The required start() method activates the coordinator.
 */

protocol Coordinator: class {
    func start()
}