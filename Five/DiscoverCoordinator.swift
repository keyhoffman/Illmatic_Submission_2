//
//  DiscoverCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

protocol DiscoverCoordinatorDelegate: class, ErrorDelegate {
    
}

final class DiscoverCoordinator: Coordinator, DiscoverViewModelCoordinatorDelegate {
    
    weak var coordinatorDelegate: DiscoverCoordinatorDelegate?
    
    private let navigationController: UINavigationController
    
    private let discoverTableViewController = DiscoverTableViewController()
    
    private let discoverViewModel: DiscoverViewModelType
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        discoverViewModel = DiscoverViewModel()
    }
    
    func start() {
        if navigationController.topViewController?.isKindOfClass(DiscoverTableViewController) == nil {
            discoverTableViewController.viewModel = discoverViewModel
            discoverViewModel.coordinatorDelegate = self
            navigationController.pushViewController(discoverTableViewController, animated: false)
        }
    }
    
    func anErrorHasOccured(errorMessage: String) {
        coordinatorDelegate?.anErrorHasOccured(errorMessage)
    }
}

