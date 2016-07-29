//
//  CalenderCoordinator.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

protocol CalenderCoordinatorDelegate: class, ErrorDelegate {
    
}

final class CalenderCoordinator: Coordinator {
    
    weak var coordinatorDelegate: CalenderCoordinatorDelegate?
    
    private let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    
    func start() {
        
    }
}

