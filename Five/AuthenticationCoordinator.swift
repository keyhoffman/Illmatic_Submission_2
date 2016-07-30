//
//  AuthenticationCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import PopupDialog

protocol AuthenticationCoordinatorDelegate: class {
    func userHasBeenAuthenticated(user user: User)
}

// MARK: - AuthenticationCoordinator

final class AuthenticationCoordinator: Coordinator, AuthenticationChecker, AuthenticationViewModelCoordinatorDelegate, ImagePickerViewModelCoordinatorDelegate {
    
    weak var coordinatorDelegate: AuthenticationCoordinatorDelegate?
    
    private let window: UIWindow
    private let rootViewController = UINavigationController()
    
    private let signUpViewController = AuthenticationViewController()
    private let loginViewController  = AuthenticationViewController()
    
    private let takeSelfieViewController = ImagePickerViewController()
    private let selectPhotoViewController = ImagePickerViewController()
    
    private let signUpViewModel: AuthenticationViewModelType
    private let loginViewModel:  AuthenticationViewModelType
    
    private let takeSelfieViewModel:  ImagePickerViewModelType
    private let selectPhotoViewModel: ImagePickerViewModelType
    
    private let authenticationModel: AuthenticationModelType
    
    init(window: UIWindow) {
        self.window = window
        
        signUpViewModel = AuthenticationViewModel(isSigningUp: true)
        loginViewModel  = AuthenticationViewModel(isSigningUp: false)
        
        takeSelfieViewModel  = ImagePickerViewModel(isTakingSelfie: true)
        selectPhotoViewModel = ImagePickerViewModel(isTakingSelfie: false)
        
        authenticationModel = AuthenticationModel()
        
        signUpViewController.viewModel = signUpViewModel
        loginViewController.viewModel  = loginViewModel
        
        signUpViewModel.model = authenticationModel
        loginViewModel.model  = authenticationModel
        
        signUpViewModel.coordinatorDelegate = self
        loginViewModel.coordinatorDelegate  = self
        
        takeSelfieViewModel.coordinatorDelegate  = self
        selectPhotoViewModel.coordinatorDelegate = self
    }
    
    func start() {
        checkForCurrentUser { result in
            switch result {
            case .Success(let user): self.coordinatorDelegate?.userHasBeenAuthenticated(user: user)
            case .Failure(_):
                self.window.rootViewController = self.rootViewController
                self.window.makeKeyAndVisible()
                if self.rootViewController.topViewController?.isKindOfClass(AuthenticationViewController) == nil {
                    self.rootViewController.pushViewController(self.signUpViewController, animated: false)
                }
            }
        }
    }
    
    
    func userHasBeenAuthenticated(user user: User) {
        rootViewController.popToRootViewControllerAnimated(false)
        coordinatorDelegate?.userHasBeenAuthenticated(user: user)
    }
    
    func anErrorHasOccured(errorMessage: String) {
        let errorPopup = PopupDialog(title: "Error", message: errorMessage)
        ErrorPopoverStyleSheet.Prepare(errorPopup)
        rootViewController.presentViewController(errorPopup, animated: true, completion: nil)
    }
    
    func navigateToLoginViewController() {
        rootViewController.pushViewController(loginViewController, animated: true)
    }
    
    func displayUserPhotos() {
        rootViewController.presentViewController(selectPhotoViewController, animated: true) {
            self.selectPhotoViewController.viewModel = self.selectPhotoViewModel
        }
    }
    
    func displayCamera() {
        rootViewController.presentViewController(takeSelfieViewController, animated: true) {
            self.takeSelfieViewController.viewModel = self.takeSelfieViewModel
        }
    }
    
    func userHasChosenImage(withData data: NSData) {
        rootViewController.dismissViewControllerAnimated(true) { 
            self.signUpViewModel.profileImageData = data
        }
    
    }
}







