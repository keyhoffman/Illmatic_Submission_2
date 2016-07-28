//
//  ArrayExt.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

extension Array where Element: UIViewController {
    func setTabBarItemTags() -> [UIViewController] {
        for vc in self.enumerate() {
            vc.element.tabBarItem.tag = vc.index
        }
        return self
    }
}