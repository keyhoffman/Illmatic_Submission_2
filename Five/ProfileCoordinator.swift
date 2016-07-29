//
//  ProfileCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import PopupDialog

protocol ProfileCoordinatorDelegate: class, ErrorDelegate {

}

final class ProfileCoordinator: Coordinator, ProfileViewModelCoordinatorDelegate {
    
    var coordinatorDelegate: ProfileCoordinatorDelegate?
    
    private let navigationController: UINavigationController
    
    private let profileViewController = ProfileViewController()
    
    private let profileViewModel: ProfileViewModelType
    
    init(navigationController: UINavigationController, user: User) {
        self.navigationController = navigationController
        
        profileViewModel = ProfileViewModel(user: user)
        profileViewModel.coordinatorDelegate = self
        
        profileViewController.viewModel = profileViewModel
        
    }
    
    func start() {
        navigationController.pushViewController(profileViewController, animated: false)
    }
    
    func anErrorHasOccured(errorMessage: String) {
        coordinatorDelegate?.anErrorHasOccured(errorMessage)
    }
    
}

