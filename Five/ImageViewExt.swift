//
//  ImageViewExt.swift
//  Five
//
//  Created by Key Hoffman on 7/30/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

extension UIImageView {
    func makeCircular(withHeight height: CGFloat) {
        
        self.frame = CGRect(x: 0, y: 0, width: 0, height: height)
        let radius = self.frame.height / 2
        self.contentMode = .ScaleToFill
        self.layer.cornerRadius = radius
        self.layer.masksToBounds = false
        self.clipsToBounds = true
    }
}