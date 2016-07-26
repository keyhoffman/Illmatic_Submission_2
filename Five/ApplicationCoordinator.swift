//
//  ApplicationCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

// MARK: - ApplicationCoordinator
/**
 The ApplicationCoordinator is the top most Coordinator of the Coordinators Tree.
 The ApplicationCoordinator is resposible for receiving the UIWindow from the AppDelegate
 and then activating the next layer of Coordinators in the Coordinators Tree. In this specifc case,
 these Coordinators are the AuthenticationCoordinator and the TabBarCoordinator. The ApplicationCoordinator
 communicates with the lower-level Coordinators directly, while the lower-level Coordinators communicate up to
 the ApplicationCoordinator via their respective delegates.
 */

class ApplicationCoordinator: Coordinator {
    
    // MARK: UIWindow Declaration
    /**
     The window constant variable recieves the main UIWindow from the AppDelegate
    */
    
    private let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    // MARK: Coordinator Implementation Methods
    
    func start() {
        
    }
}