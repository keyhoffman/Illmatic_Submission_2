//
//  ProfileViewControllerStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/28/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

struct ProfileViewControllerStyleSheet: ViewPreparer {
    
    private static let imageViewTopToViewTopOffsetFactor: CGFloat = 0.15
    private static let imageViewHeightToViewHeightFactor: CGFloat = 0.20
    
    private static let usernameLabelTopToImageViewTopOffsetFactor: CGFloat = 0.03
    
    private static let labelSeparationOffset = 30
    
    private static let labelHeight = 40
    
    private static let labelWidthToViewWidthFactor  = 0.80
    private static let buttonWidthToViewWidthFactor = 0.40
    
    static func Prepare(profileVC: ProfileViewController) {
        
        defer { profileVC.loadViewIfNeeded() }
        
        profileVC.view.backgroundColor = Color.FiveGray.color
        
        profileVC.title = "Profile"
        
        let viewHeight = profileVC.view.bounds.height
        
        let imageViewTopToViewTopOffset             = viewHeight * imageViewTopToViewTopOffsetFactor
        let usernameLabelTopToImageViewBottomOffset = viewHeight * usernameLabelTopToImageViewTopOffsetFactor
        
        profileVC.imageView.makeCircular(withHeight: viewHeight * imageViewHeightToViewHeightFactor)
        
        profileVC.view.addSubview(profileVC.imageView)
        profileVC.view.addSubview(profileVC.spinner)
        profileVC.view.addSubview(profileVC.contactLabel)
        profileVC.view.addSubview(profileVC.descriptionLabel)
        profileVC.view.addSubview(profileVC.usernameLabel)
        
        profileVC.imageView.snp_makeConstraints { make in
            make.centerX.equalTo(profileVC.view.snp_centerX)
            make.height.equalTo(profileVC.view.snp_height).multipliedBy(imageViewHeightToViewHeightFactor)
            make.width.equalTo(profileVC.view.snp_height).multipliedBy(imageViewHeightToViewHeightFactor)
            make.top.equalTo(profileVC.view.snp_top).offset(imageViewTopToViewTopOffset)
        }
        
        profileVC.spinner.snp_makeConstraints { make in
            make.center.equalTo(profileVC.imageView.snp_center)
        }
        
        profileVC.usernameLabel.snp_makeConstraints { make in
            make.centerX.equalTo(profileVC.view.snp_centerX)
            make.top.equalTo(profileVC.imageView.snp_bottom).offset(usernameLabelTopToImageViewBottomOffset)
            make.width.equalTo(profileVC.view.snp_width).multipliedBy(labelWidthToViewWidthFactor)
        }
        
        profileVC.contactLabel.snp_makeConstraints { make in
            make.centerX.equalTo(profileVC.view.snp_centerX)
            make.width.equalTo(profileVC.view.snp_width).multipliedBy(labelWidthToViewWidthFactor)
            make.top.equalTo(profileVC.usernameLabel.snp_bottom).offset(labelSeparationOffset)
//            make.height.equalTo(labelHeight)
        }
        
        profileVC.descriptionLabel.snp_makeConstraints { make in
            make.centerX.equalTo(profileVC.view.snp_centerX)
            make.width.equalTo(profileVC.view.snp_width).multipliedBy(labelWidthToViewWidthFactor)
            make.top.equalTo(profileVC.contactLabel.snp_bottom).offset(labelSeparationOffset)
//            make.height.equalTo(labelHeight)
        }
        
    }
    
    enum LoadImageActivityIndicator {
        case LoadingActivity
        
        var indicator: UIActivityIndicatorView {
            return ActivityIndicator.WhiteLarge.indicator
        }
    }
    
    enum ProfileLabel {
        case Contact, Username, Description
        
        var label: UILabel {
            switch self {
            case Contact:     return Label.UserContactInfo.label
            case Username:    return Label.Username.label
            case Description: return Label.UserDescription.label
            }
        }
    }
    
}