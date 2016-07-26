//
//  Result.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

// MARK: - Result

enum Result<T> {
    typealias Value = T
    
    case Success(Value)
    case Failure(NSError)
}
