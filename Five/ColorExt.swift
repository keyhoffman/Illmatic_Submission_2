//
//  ColorExt.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    static func fiveBlue(withAlpha alpha: CGFloat) -> UIColor {
        return UIColor(red: 50/255, green: 104/255, blue: 255/255, alpha: alpha)
    }
    
    static func fiveRed() -> UIColor {
        return UIColor(red: 255/255, green: 58/255, blue: 0/255, alpha: 1.0)
    }
    
    static func fiveGray() -> UIColor {
        return UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1.0)
    }
    
    static func fiveOrange() -> UIColor {
        return UIColor(red: 244/255, green: 85/255, blue: 18/255, alpha: 1.0)
    }
    
    static func darkGray() -> UIColor {
        return UIColor(red:0.23, green:0.23, blue:0.27, alpha:1.00)
    }
    
    static func whiteGrayScale08() -> UIColor {
        return UIColor(white: 0.8, alpha: 1)
    }
}