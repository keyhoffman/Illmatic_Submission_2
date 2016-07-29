//
//  CreateEventViewControllerStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

struct CreateEventViewControllerStyleSheet: ViewPreparer {
    
    static func Prepare(createVC: CreateEventViewController) {
        
        createVC.view.backgroundColor = Color.FiveBlue.color
    }
}