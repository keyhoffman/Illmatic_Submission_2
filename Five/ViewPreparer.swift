//
//  ViewPreparer.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - ViewPreparer Protocol

protocol ViewPreparer {
    associatedtype ViewType: Any
    static func Prepare(subject: ViewType)
}