//
//  CreateEventCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

protocol CreateEventCoordinatorDelegate: class {
    
}

final class CreateEventCoordinator: Coordinator {
    
    weak var coordinatorDelegate: CreateEventCoordinatorDelegate?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    
    func start() {
        
    }
}

