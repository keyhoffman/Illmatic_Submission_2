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
        
        discoverTVC.tableView.rowHeight = discoverTVC.view.frame.height
        discoverTVC.tableView.allowsSelection = false
        discoverTVC.view.backgroundColor = Color.FiveGray.color
        
        discoverTVC.navigationController?.navigationItem.titleView = UIImageView(image: IconAssest.FiveLogo.icon)
    }
}