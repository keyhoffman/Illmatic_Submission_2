//
//  ProfileViewController.swift
//  Five
//
//  Created by Key Hoffman on 7/28/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, ProfileViewModelViewDelegate {

    var viewModel: ProfileViewModelType? {
        didSet { viewModel?.viewDelegate = self }
    }
    
    let imageView = UIImageView()
    
    let descriptionLabel = ProfileViewControllerStyleSheet.ProfileLabel.Description.label
    let usernameLabel    = ProfileViewControllerStyleSheet.ProfileLabel.Username.label
    let contactLabel     = ProfileViewControllerStyleSheet.ProfileLabel.Contact.label
    
    let spinner = ProfileViewControllerStyleSheet.LoadImageActivityIndicator.LoadingActivity.indicator
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        ProfileViewControllerStyleSheet.Prepare(self)
    }
    
    func setLabels(description description: String, contactInfo: String, username: String) {
        descriptionLabel.text = description
        contactLabel.text     = contactInfo
        usernameLabel.text    = username
    }
    
    func setProfileImage(withData data: NSData) {
        spinner.stopAnimating()
        imageView.image = UIImage(data: data)
    }
    
}
