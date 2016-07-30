//
//  MainTabBarViewModel.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

protocol MainTabBarViewModelCoordinatorDelegate: class {
    func userDidSelecTab(atIndex index: Int)
}

protocol MainTabBarViewModelViewDelegate: class {
    
}

protocol MainTabBarViewModelType: class {
    weak var viewDelegate:        MainTabBarViewModelViewDelegate?        { get set }
    weak var coordinatorDelegate: MainTabBarViewModelCoordinatorDelegate? { get set }
    
    func userDidSelectTab(atIndex index: Int)
}

final class MainTabBarViewModel: MainTabBarViewModelType {
    
    weak var coordinatorDelegate: MainTabBarViewModelCoordinatorDelegate?
    weak var viewDelegate:        MainTabBarViewModelViewDelegate?
    
    func userDidSelectTab(atIndex index: Int) {
        coordinatorDelegate?.userDidSelecTab(atIndex: index)
    }
    
}
