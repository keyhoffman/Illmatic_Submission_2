//
//  MainTabStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

struct MainTabBarStyleSheet: ViewPreparer {
    
    static func Prepare(mainTabCon: MainTabController) {
        
        mainTabCon.tabBar.tintColor = Color.FiveRed.color
        
        mainTabCon.addCustomBackgroundColor(Color.FiveBlue.color, atIndex: 3) //TODO: Change index input from int literal
    }

    enum TabBarItem: String {
        case Discover, Calender, Profile, CreateEvent = "Create"
        
        var tabBarItem: UITabBarItem {
            let t = UITabBarItem()
            t.title = title
            t.image = icon
            return t
        }
        
        private var title: String {
            return self.rawValue
        }
        
        private var icon: UIImage? {
            switch self {
            case Discover:    return IconAssest.HandGray.icon
            case Calender:    return IconAssest.CalenderGray.icon
            case Profile:     return IconAssest.ProfileGray.icon
            case CreateEvent: return IconAssest.StarsWhite.icon
            }
        }
    }
}