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
        return UIColor(red: 50, green: 104, blue: 255, alpha: alpha)
    }
    
    static func fiveRed(withAlpha alpha: CGFloat) -> UIColor {
        return UIColor(red: 255, green: 58, blue: 0, alpha: alpha)
    }
    
    static func fiveGray(withAlpha alpha: CGFloat) -> UIColor {
        return UIColor(red: 242, green: 242, blue: 242, alpha: alpha)
    }
    
    static func fiveOrange(withAlpha alpha: CGFloat) -> UIColor {
        return UIColor(red: 244, green: 85, blue: 18, alpha: alpha)
    }
}