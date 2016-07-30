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
    case FiveBlue, FiveBlueTrans, FiveRed, FiveGray, FiveOrange, White, DarkGray, WhiteGrayScale08, Black, Clear
    
    var color: UIColor {
        switch self {
        case FiveBlue:         return .fiveBlue(withAlpha: 1.0)
        case FiveBlueTrans:    return .fiveBlue(withAlpha: 0.8)
        case FiveRed:          return .fiveRed()
        case FiveGray:         return .fiveGray()
        case FiveOrange:       return .fiveOrange()
        case White:            return .whiteColor()
        case DarkGray:         return .darkGray()
        case WhiteGrayScale08: return .whiteGrayScale08()
        case Black:            return .blackColor()
        case Clear:            return .clearColor()
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
    case Cancel, SendInvite, JoinEvent, SaveEvent, AddImageFromPhotos, AddImageFromCamera
    
    var button: UIButton {
        let b = UIButton(type: .Custom)
        b.setTitle(self.property.title, forState: .Normal)
        b.backgroundColor = self.property.backgroundColor
        b.setImage(self.property.image, forState: .Normal)
        b.titleLabel?.font = Font.HelveticaNeueMedium(size: 20).font
        b.layer.cornerRadius = 10
        b.titleLabel?.textColor = property.textColor
        return b
    }
    
    private var property: (title: String?, backgroundColor: UIColor?, image: UIImage?, textColor: UIColor?) {
        switch self {
        case JoinEvent:          return ("Join Event", Color.FiveBlue.color, nil, Color.White.color)
        case SaveEvent:          return ("Save Event", Color.FiveBlue.color, nil, Color.White.color)
        case Cancel:             return (nil, nil, IconAssest.CancelEvent.icon, nil)
        case SendInvite:         return (nil, nil, IconAssest.PaperPlaneInvite.icon, nil)
        case AddImageFromPhotos: return ("Photos", Color.FiveRed.color, nil, Color.White.color)
        case AddImageFromCamera: return ("Selfie", Color.FiveOrange.color, nil, Color.White.color)
        }
    }
}

enum Label {
    case ImageInstructions, DescriptionInstructions, Username, UserDescription, UserContactInfo, EventViewTitle
    case EventDetailHost, EventDetailDescription, EventDetailDetails, EventDetailTitle, Seperator
    
    var label: UILabel {
        let l = UILabel()
        l.text = text
        l.textColor = textColor
        l.textAlignment = .Center
        l.font = fontAndSize
        l.numberOfLines = 0
        l.sizeToFit()
        l.backgroundColor = backgroundColor
        return l
    }
    
    private var text: String? {
        switch self {
        case ImageInstructions:       return "Select an image for your profile"
        case DescriptionInstructions: return "Write a one line bio!"
        default:                      return nil
        }
    }
    
    private var textColor: UIColor? {
        switch self {
        case ImageInstructions:       return Color.White.color
        case DescriptionInstructions: return Color.White.color
        case Username:                return Color.Black.color
        case UserDescription:         return Color.Black.color
        case UserContactInfo:         return Color.Black.color
        case EventViewTitle:          return Color.White.color
        case EventDetailTitle:        return Color.FiveOrange.color
        case EventDetailHost:         return Color.Black.color
        case EventDetailDescription:  return Color.Black.color
        case EventDetailDetails:      return Color.Black.color
        default:                      return nil
        }
    }
    
    private var fontAndSize: UIFont? {
        switch self {
        case EventViewTitle:         return Font.HelveticaNeue(size: 24).font
        case EventDetailTitle:       return Font.HelveticaNeue(size: 24).font
        case EventDetailHost:        return Font.HelveticaNeueLight(size: 16).font
        case EventDetailDescription: return Font.HelveticaNeueLight(size: 16).font
        case EventDetailDetails:     return Font.HelveticaNeueLight(size: 16).font
        default:                     return Font.HelveticaNeueMedium(size: 18).font
        }
    }
    
    private var backgroundColor: UIColor? {
        switch self {
        case Seperator: return Color.FiveGray.color
        default:        return Color.Clear.color
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

// MARK: - Font

enum Font {
    case HelveticaNeue(size: CGFloat)
    case HelveticaNeueLight(size: CGFloat)
    case HelveticaNeueMedium(size: CGFloat)
    
    var font: UIFont! {
        switch self {
        case HelveticaNeue(let size):       return UIFont(name: "HelveticaNeue", size: size)
        case HelveticaNeueLight(let size):  return UIFont(name: "HelveticaNeue-Light", size: size)
        case HelveticaNeueMedium(let size): return UIFont(name: "HelveticaNeue-Medium", size: size)
        }
    }
}

enum ActivityIndicator {
    case WhiteLarge, White, Gray
    
    var indicator: UIActivityIndicatorView {
        let i = UIActivityIndicatorView()
        i.activityIndicatorViewStyle                = style
        i.hidesWhenStopped                          = true
        i.translatesAutoresizingMaskIntoConstraints = false
        return i
    }
    
    private var style: UIActivityIndicatorViewStyle {
        switch self {
        case WhiteLarge: return .WhiteLarge
        case White:      return .White
        case Gray:       return .Gray
        }
    }
}











