//
//  General.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

enum Color {
    case FiveBlue(alpha: CGFloat) // Join Event Background(alpha = 0.6), Current Tab Color, Join + Save Event Button Color, in-app logo
    case FiveRed(alpha: CGFloat)  // Card x button, title color, mail paper airplane color
    case FiveGray(alpha: CGFloat) // Background Color
    case FiveOrange(alpha: CGFloat) // navigation barbutton color, tabBarItem none selected item image outline color
    
    var color: UIColor {
        switch self {
        case FiveBlue(let alpha):   return .fiveBlue(withAlpha: alpha)
        case FiveRed(let alpha):    return .fiveRed(withAlpha: alpha)
        case FiveGray(let alpha):   return .fiveGray(withAlpha: alpha)
        case FiveOrange(let alpha): return .fiveOrange(withAlpha: alpha)
        }
    }
}