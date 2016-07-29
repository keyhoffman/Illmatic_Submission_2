//
//  DiscoverTableViewController.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

final class DiscoverTableViewController: DynamicTableViewController<EventTableViewCell>, DiscoverViewModelViewDelegate {
    
    var viewModel: DiscoverViewModelType? {
        didSet { viewModel?.viewDelegate = self }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        DiscoverTableViewControllerStyleSheet.Prepare(self)
    }
    
    func appendEvent(event: Event) {
        self.data.append(event)
    }
}