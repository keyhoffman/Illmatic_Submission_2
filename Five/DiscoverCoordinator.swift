//
//  DiscoverCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

protocol DiscoverCoordinatorDelegate: class {
    
}

final class DiscoverCoordinator: Coordinator {
    
    weak var coordinatorDelegate: DiscoverCoordinatorDelegate?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
}

