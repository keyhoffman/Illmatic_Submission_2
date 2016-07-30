//
//  MainTabController.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

class MainTabController: UITabBarController, UITabBarControllerDelegate, MainTabBarViewModelViewDelegate {
    
    var viewModel: MainTabBarViewModelType? {
        didSet { viewModel?.viewDelegate = self }
    }
    
    init(viewControllers: [UIViewController]) {
        super.init(nibName: nil, bundle: nil)
        self.delegate = self
        self.viewControllers = viewControllers
        MainTabBarStyleSheet.Prepare(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tabBarController(tabBarController: UITabBarController, didSelectViewController viewController: UIViewController) {
        viewModel?.userDidSelectTab(atIndex: viewController.tabBarItem.tag)
    }
    
}
