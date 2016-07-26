//
//  AuthenticationCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

protocol AuthenticationCoordinatorDelegate: class {
    func userHasBeenAuthenticated(user: User)
}

// MARK: - AuthenticationCoordinator

class AuthenticationCoordinator: Coordinator, AuthenticationChecker {
    
    private let window: UIWindow
    private let rootViewController = UINavigationController()
    
    weak var coordinatorDelegate: AuthenticationCoordinatorDelegate?
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
        if let user = checkForCurrentUser() { coordinatorDelegate?.userHasBeenAuthenticated(user) }
        else {
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
            rootViewController.pushViewController(<#T##viewController: UIViewController##UIViewController#>, animated: false)
        }
        
    }
}