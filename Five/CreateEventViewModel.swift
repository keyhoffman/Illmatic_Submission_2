//
//  CreateEventViewModel.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

protocol CreateEventViewModelViewDelegate: class {
    
}

protocol CreateEventViewModelCoordinatorDelegate: class {
    
}

protocol CreateEventViewModelType: class {
    weak var viewDelegate:        CreateEventViewModelViewDelegate?        { get set }
    weak var coordinatorDelegate: CreateEventViewModelCoordinatorDelegate? { get set }
}

final class CreateEventViewModel: CreateEventViewModelType {
    
    weak var coordinatorDelegate: CreateEventViewModelCoordinatorDelegate?
    weak var viewDelegate:        CreateEventViewModelViewDelegate?
    
}