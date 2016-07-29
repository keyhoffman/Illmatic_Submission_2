//
//  GCD.swift
//  Five
//
//  Created by Key Hoffman on 7/28/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

func performUpdatesOnMainThread(updates: Void -> Void) {
    dispatch_async(dispatch_get_main_queue()) {
        updates()
    }
}