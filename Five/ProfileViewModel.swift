//
//  File.swift
//  Five
//
//  Created by Key Hoffman on 7/28/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation


protocol ProfileViewModelCoordinatorDelegate: class, ErrorDelegate {

}

protocol ProfileViewModelViewDelegate: class {
    func setProfileImage(withData data: NSData)
    func setLabels(description description: String, contactInfo: String, username: String)
}

protocol ProfileViewModelType: class {
    weak var viewDelegate:        ProfileViewModelViewDelegate?        { get set }
    weak var coordinatorDelegate: ProfileViewModelCoordinatorDelegate? { get set }
    
    init(user: User)
}

final class ProfileViewModel: ProfileViewModelType {
    
    weak var coordinatorDelegate: ProfileViewModelCoordinatorDelegate?
    weak var viewDelegate: ProfileViewModelViewDelegate? {
        didSet {
            viewDelegate?.setLabels(description: user.description, contactInfo: user.email, username: user.username)
            loadProfilePic()
        }
    }
    
    private let user: User
    
    init(user: User) {
        self.user = user
    }

    private func loadProfilePic() {
        user.loadImageData { result in
            switch result {
            case .Failure(let error):     self.coordinatorDelegate?.anErrorHasOccured(error.localizedDescription)
            case .Success(let imageData): self.viewDelegate?.setProfileImage(withData: imageData)
            }
        }
    }
}