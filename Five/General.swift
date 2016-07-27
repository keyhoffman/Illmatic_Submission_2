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
    case FiveBlue    // Create Tab Color, Join + Save Event Button Color, in-app logo
    case FiveBlueBG  // Join Event Background
    case FiveRed     // Card x button, title color, mail paper airplane color
    case FiveGray    // Background Color
    case FiveOrange  // navigation barbutton color, tabBarItem none selected item image outline color
    
    var color: UIColor {
        switch self {
        case FiveBlue:   return .fiveBlue(withAlpha: 1.0)
        case FiveBlueBG: return .fiveBlue(withAlpha: 0.8)
        case FiveRed:    return .fiveRed()
        case FiveGray:   return .fiveGray()
        case FiveOrange: return .fiveOrange()
        }
    }
}

enum IconAssest: String {
    case CalenderGray, CalenderWhite, CancelEvent, FiveLogo, HandGray, HandWhite, HighFives, PaperPlaneInvite, ProfileGray, ProfileWhite, StarsGray, StarsWhite
    
    var icon: UIImage? {
        return UIImage(named: self.rawValue)
    }
    
}

enum Button {
    case Cancel, SendInvite, JoinEvent, SaveEvent
    
    var button: UIButton {
        let b = UIButton(type: .Custom)
        b.setTitle(self.property.title, forState: .Normal)
        b.backgroundColor = self.property.color
        b.setImage(self.property.image, forState: .Normal)
        return b
    }
    
    private var property: (title: String?, color: UIColor?, image: UIImage?) {
        switch self {
        case JoinEvent:  return ("Join Eventttttttttttttttttt", Color.FiveBlue.color, nil)
        case SaveEvent:  return ("Save Eventttttttttttttttttt", Color.FiveBlue.color, nil)
        case Cancel:     return (nil, nil, IconAssest.CancelEvent.icon)
        case SendInvite: return (nil, nil, IconAssest.PaperPlaneInvite.icon)
        }
    }
}