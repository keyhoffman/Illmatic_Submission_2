//
//  DiscoverTableViewControllerStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

struct DiscoverTableViewControllerStyleSheet: ViewPreparer {
    
    static func Prepare(discoverTVC: DiscoverTableViewController) {
        
        discoverTVC.tableView.rowHeight = 300
    }
}