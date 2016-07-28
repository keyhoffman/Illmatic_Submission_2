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
    case FiveBlueTrans  // Join Event Background
    case FiveRed     // Card x button, title color, mail paper airplane color
    case FiveGray    // Background Color
    case FiveOrange  // navigation barbutton color, tabBarItem none selected item image outline color
    case White
    
    var color: UIColor {
        switch self {
        case FiveBlue:      return .fiveBlue(withAlpha: 1.0)
        case FiveBlueTrans: return .fiveBlue(withAlpha: 0.8)
        case FiveRed:       return .fiveRed()
        case FiveGray:      return .fiveGray()
        case FiveOrange:    return .fiveOrange()
        case White:         return .whiteColor()
        }
    }
}

enum IconAssest: String {
    case CalenderGray, CalenderWhite, CancelEvent, FiveLogo, HandGray, HandWhite, HighFives, PaperPlaneInvite, ProfileGray, ProfileWhite, StarsGray, StarsWhite
    
    var icon: UIImage? {
        return UIImage(named: self.rawValue)
    }
}

enum ImageAssest: String {
    case BearArt, BoarsAboveBar, ChinaTown, ClockTower, FriendsOnBeach, KiteFest, LookoutView, Park, PinkDeathBunnies, SanFransisco, Shoes, SurferAtSunset, SurferOnBeach
    
    var image: UIImage? {
        return UIImage(named: self.rawValue)
    }
}

enum Button {
    case Cancel, SendInvite, JoinEvent, SaveEvent, AddProfileImage
    
    var button: UIButton {
        let b = UIButton(type: .Custom)
        b.setTitle(self.property.title, forState: .Normal)
        b.backgroundColor = self.property.color
        b.setImage(self.property.image, forState: .Normal)
        return b
    }
    
    private var property: (title: String?, color: UIColor?, image: UIImage?) {
        switch self {
        case JoinEvent:       return ("Join Event", Color.FiveBlue.color, nil)
        case SaveEvent:       return ("Save Event", Color.FiveBlue.color, nil)
        case Cancel:          return (nil, nil, IconAssest.CancelEvent.icon)
        case SendInvite:      return (nil, nil, IconAssest.PaperPlaneInvite.icon)
        case AddProfileImage: return ("Tap to add a profile image", Color.FiveBlueTrans.color, nil)
        }
    }
}

enum TextField {
    case Email, Password, Username, UserDescription
    
    var textField: UITextField {
        let tf = UITextField()
        tf.defaultSettings()
        tf.placeholder     = placeholder
        tf.backgroundColor = Color.White.color
        tf.secureTextEntry = secureTextEntry
        tf.borderStyle     = .RoundedRect
        tf.keyboardType    = keyboardType
        return tf
    }
    
    private var placeholder: String {
        switch self {
        case Email:           return "Enter your email"
        case Password:        return "Enter your password"
        case Username:        return "Enter your username"
        case UserDescription: return "Tell us something interesting!"
        }
    }
    
    private var secureTextEntry: Bool {
        switch self {
        case Password: return true
        default:       return false
        }
    }
    
    private var keyboardType: UIKeyboardType {
        switch self {
        case Email: return .EmailAddress
        default:    return .Default
        }
    }
}


