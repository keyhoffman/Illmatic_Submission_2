//
//  CreateEventTableViewController.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

class CreateEventViewController: UIViewController, CreateEventViewModelViewDelegate {

    var viewModel: CreateEventViewModelType? {
        didSet { viewModel?.viewDelegate = self }
    }

    
 

}
