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
    func userHasBeenAuthenticated(user user: User)
}

// MARK: - AuthenticationCoordinator

final class AuthenticationCoordinator: Coordinator, AuthenticationChecker, AuthenticationViewModelCoordinatorDelegate, UIImagePickerControllerDelegate {
    
    weak var coordinatorDelegate: AuthenticationCoordinatorDelegate?
    
    private let window: UIWindow
    private let rootViewController = UINavigationController()
    
    private let signUpViewController = AuthenticationViewController()
    private let loginViewController  = AuthenticationViewController()
    
    private let signUpViewModel: AuthenticationViewModelType
    private let loginViewModel:  AuthenticationViewModelType
    
    private let authenticationModel: AuthenticationModelType
    
    init(window: UIWindow) {
        self.window = window
        
        signUpViewModel = AuthenticationViewModel(isSigningUp: true)
        loginViewModel  = AuthenticationViewModel(isSigningUp: false)
        
        authenticationModel = AuthenticationModel()
        
        signUpViewController.viewModel = signUpViewModel
        loginViewController.viewModel  = loginViewModel
        
        signUpViewModel.model = authenticationModel
        loginViewModel.model  = authenticationModel
        
        signUpViewModel.coordinatorDelegate = self
        loginViewModel.coordinatorDelegate  = self
    }
    
    func start() {
        if let user = checkForCurrentUser() { coordinatorDelegate?.userHasBeenAuthenticated(user: user) }
        else {
            window.rootViewController = rootViewController
            window.makeKeyAndVisible()
            rootViewController.pushViewController(signUpViewController, animated: false)
        }
    }
    
    func userHasBeenAuthenticated(user user: User) {
        coordinatorDelegate?.userHasBeenAuthenticated(user: user)
    }
    
    func anErrorHasOccured(errorMessage: String) {
        print("ERROR: \(errorMessage)")
    }
    
    func navigateToLoginViewController() {
        rootViewController.pushViewController(loginViewController, animated: true)
    }
    
    func displayUserPhotos() {
        <#code#>
    }
}







