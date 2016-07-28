//
//  TabBarControllerExt.swift
//  Five
//
//  Created by Key Hoffman on 7/28/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

extension UITabBarController {
    func addCustomBackgroundColor(color: UIColor, atIndex index: Int) {
        guard let itemsCount = self.tabBar.items?.count where index < self.viewControllers?.count && index >= 0 else { return }
        
        
        let itemIndex = CGFloat(index)
        let itemWidth = self.tabBar.frame.width / CGFloat(itemsCount)
        
        let backgroundView = UIView(frame: CGRectMake(itemWidth * itemIndex, 0, itemWidth, self.tabBar.frame.height))
        backgroundView.backgroundColor = color
        self.tabBar.insertSubview(backgroundView, atIndex: 0)
    }
}
