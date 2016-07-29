//
//  ApplicationCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import Firebase // TODO: DELETE

// MARK: - ApplicationCoordinator
/**
 The ApplicationCoordinator is the top most Coordinator of the Coordinators Tree.
 The ApplicationCoordinator is resposible for receiving the UIWindow from the AppDelegate
 and then activating the next layer of Coordinators in the Coordinators Tree. In this specifc case,
 these Coordinators are the AuthenticationCoordinator and the TabBarCoordinator. The ApplicationCoordinator
 communicates with the lower-level Coordinators directly, while the lower-level Coordinators communicate up to
 the ApplicationCoordinator via their respective delegates.
 */

final class ApplicationCoordinator: Coordinator, AuthenticationCoordinatorDelegate, MainTabBarCoordinatorDelegate {
    
    // MARK: UIWindow Declaration
    /**
     The window constant variable recieves the main UIWindow from the AppDelegate
    */
    
    private let window: UIWindow
    private let authenticationCoordinator: AuthenticationCoordinator
    
    init(window: UIWindow) {
        self.window = window

        authenticationCoordinator = AuthenticationCoordinator(window: self.window)
        authenticationCoordinator.coordinatorDelegate = self
    }
    
    // MARK: Coordinator Implementation Methods
    
    func start() {
        try! FIRAuth.auth()?.signOut() // TODO: DELETE
        authenticationCoordinator.start()
    }
    
    // MARK: AuthenticationCoordinatorDelegate Implementation Methods
    
    func userHasBeenAuthenticated(user user: User) {
        let tabBarCoordinator = MainTabBarCoordinator(window: self.window, user: user)
        tabBarCoordinator.coordinatorDelegate = self
        tabBarCoordinator.start()
    }
    
}