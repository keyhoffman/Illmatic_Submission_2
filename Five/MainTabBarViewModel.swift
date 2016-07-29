//
//  MainTabBarViewModel.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

protocol MainTabBarViewModelCoordinatorDelegate: class {
    
}

protocol MainTabBarViewModelViewDelegate: class {
    
}

protocol MainTabBarViewModelType: class {
    weak var viewDelegate: MainTabBarViewModelViewDelegate? { get set }
    weak var coordinatorDelegate: MainTabBarCoordinatorDelegate? { get set }
    
}

final class MainTabBarViewModel: MainTabBarViewModelType {
    
    weak var coordinatorDelegate: MainTabBarCoordinatorDelegate?
    weak var viewDelegate: MainTabBarViewModelViewDelegate?
    
}
