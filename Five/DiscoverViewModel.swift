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
    func appendHost(user: User)
    func appendHostProfileImageData(data: NSData)
}

protocol DiscoverViewModelType: class {
    
    weak var viewDelegate:        DiscoverViewModelViewDelegate?        { get set }
    weak var coordinatorDelegate: DiscoverViewModelCoordinatorDelegate? { get set }
}

final class DiscoverViewModel: DiscoverViewModelType {
    
    
    weak var coordinatorDelegate: DiscoverViewModelCoordinatorDelegate?
    weak var viewDelegate: DiscoverViewModelViewDelegate? { didSet { beginLoadingEvents() } }
    
    private func beginLoadingEvents() {
        Event.loadChildAdded { result in
            switch result {
            case .Failure(let error): self.coordinatorDelegate?.anErrorHasOccured(error.localizedDescription)
            case .Success(let event): self.loadHost(forEvent: event)
            }
        }
    }
    
    private func loadHost(forEvent event: Event) {
        Event.loadValue(withKey: event.creatorKey, forType: User.self) { result in
            switch result {
            case .Failure(let error): self.coordinatorDelegate?.anErrorHasOccured(error.localizedDescription)
            case .Success(let host): self.loadProfileImage(forHost: host, atEvent: event)
                
            }
        }
    }
    
    private func loadProfileImage(forHost host: User, atEvent event: Event) {
        host.loadImageData { result in
            switch result {
            case .Failure(let error):     self.coordinatorDelegate?.anErrorHasOccured(error.localizedDescription)
            case .Success(let imageData): self.viewDelegate?.appendEvent(event)
                                          self.viewDelegate?.appendHost(host)
                                          self.viewDelegate?.appendHostProfileImageData(imageData)
            }
        }
    }
}