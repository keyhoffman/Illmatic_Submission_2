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
        
        defer { discoverTVC.view.layoutIfNeeded() }
        
        discoverTVC.tableView.rowHeight = discoverTVC.view.frame.height
        discoverTVC.tableView.allowsSelection = false
        discoverTVC.view.backgroundColor = Color.FiveGray.color
        
        let titleImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 38, height: 38))
        titleImageView.image = IconAssest.FiveLogo.icon
        titleImageView.contentMode = .ScaleAspectFit
        
        discoverTVC.navigationItem.titleView = titleImageView
        
        discoverTVC.navigationController?.navigationBar.barTintColor = Color.White.color
    }
}