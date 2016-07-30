//
//  CreateEventCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

protocol CreateEventCoordinatorDelegate: class, ErrorDelegate {
    
}

final class CreateEventCoordinator: Coordinator, CreateEventViewModelCoordinatorDelegate {
    
    weak var coordinatorDelegate: CreateEventCoordinatorDelegate?
    
    private let navigationController: UINavigationController
    
    private let createEventViewController = CreateEventViewController()
    
    private let createEventViewModel: CreateEventViewModelType
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
        
        createEventViewModel = CreateEventViewModel()
        
        createEventViewController.viewModel = createEventViewModel
        
        createEventViewModel.coordinatorDelegate = self
    }

    
    func start() {
        if navigationController.topViewController?.isKindOfClass(CreateEventViewController) == nil {
            navigationController.presentViewController(createEventViewController, animated: false, completion: nil)
        }
    }
}

