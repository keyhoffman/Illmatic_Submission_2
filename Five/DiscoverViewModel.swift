//
//  File.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

protocol DiscoverViewModelCoordinatorDelegate: class, ErrorDelegate {
    
}

protocol DiscoverViewModelViewDelegate: class {
    func appendEvent(event: Event)
}

protocol DiscoverViewModelType: class {
    
    weak var viewDelegate:        DiscoverViewModelViewDelegate?        { get set }
    weak var coordinatorDelegate: DiscoverViewModelCoordinatorDelegate? { get set }
}

final class DiscoverViewModel: DiscoverViewModelType {
    
    
    weak var coordinatorDelegate: DiscoverViewModelCoordinatorDelegate?
    weak var viewDelegate: DiscoverViewModelViewDelegate? { didSet { print("DiscoverViewModel View delegate set");beginLoadingEvents() } }
    
    private func beginLoadingEvents() {
        Event.loadChildAdded { result in
            switch result {
            case .Failure(let error): self.coordinatorDelegate?.anErrorHasOccured(error.localizedDescription)
            case .Success(let event): self.viewDelegate?.appendEvent(event)
            }
        }
    }
}