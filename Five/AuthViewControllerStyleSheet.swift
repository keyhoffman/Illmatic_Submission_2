//
//  AuthViewControllerStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/27/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

struct AuthViewControllerStyleSheet: ViewPreparer {
    
    static let SignUpTitle = "Sign Up"
    static let LoginTitle  = "Login"
    
    static let ValidEmailCharacterCount       = 5
    static let ValidPasswordCharacterCount    = 5
    static let ValidUsernameCharacterCount    = 5
    static let ValidDescriptionCharacterCount = 10
    
    static let ValidEmailPredicateArguments = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,32}"
    static let ValidEmailPredicateFormat    = "SELF MATCHES %@"

    private static let emailTextFieldWidthToViewWidthFactor   = 0.80
    private static let emailTextFieldHeightToViewHeightFactor = 0.05
    private static let emailTextFieldTopToViewTopOffsetFactor = 0.20
    
    private static let addImageButtonWidthToViewWidthFactor   = 0.35
    private static let addImageButtonTopToViewTopOffsetFactor = 0.15
    
    private static let descriptionTextFieldTopToAddImageButtonButtonOffset = 40.0
    
    static func Prepare(authVC: AuthenticationViewController) {
        
        authVC.view.backgroundColor = Color.FiveBlue.color
        
        let viewHeight = authVC.view.bounds.height
        
        let emailTextFieldTopToViewTopOffset = viewHeight * CGFloat(emailTextFieldTopToViewTopOffsetFactor)
        let addImageButtonTopToViewTopOffset = viewHeight * CGFloat(addImageButtonTopToViewTopOffsetFactor)
        
        authVC.passwordTextField.hidden     = true
        authVC.usernameTextField.hidden     = true
        authVC.descriptionTextField.hidden  = true
        
        authVC.emailTextField.becomeFirstResponder()
        
        authVC.addProfileImageFromCameraButton.hidden = true
        authVC.addProfileImageFromPhotosButton.hidden = true
        
        authVC.descriptionInstructionsLabel.hidden = true
        authVC.imageInstructionsLabel.hidden       = true
        
        authVC.spinner.hidden = true
        
        authVC.view.addSubview(authVC.emailTextField)
        authVC.view.addSubview(authVC.passwordTextField)
        authVC.view.addSubview(authVC.usernameTextField)
        authVC.view.addSubview(authVC.descriptionTextField)
        authVC.view.addSubview(authVC.addProfileImageFromCameraButton)
        authVC.view.addSubview(authVC.addProfileImageFromPhotosButton)
        authVC.view.addSubview(authVC.descriptionInstructionsLabel)
        authVC.view.addSubview(authVC.imageInstructionsLabel)
        authVC.view.addSubview(authVC.spinner)
        
        authVC.emailTextField.snp_makeConstraints { make in
            make.centerX.equalTo(authVC.view.snp_centerX)
            make.width.equalTo(authVC.view).multipliedBy(emailTextFieldWidthToViewWidthFactor)
            make.height.equalTo(authVC.view).multipliedBy(emailTextFieldHeightToViewHeightFactor)
            make.top.equalTo(authVC.view).offset(emailTextFieldTopToViewTopOffset)
        }
        
        authVC.passwordTextField.snp_makeConstraints { make in
            make.width.equalTo(authVC.emailTextField)
            make.centerX.equalTo(authVC.emailTextField)
            make.top.equalTo(authVC.emailTextField.snp_bottom)
            make.height.equalTo(authVC.emailTextField)
        }
        
        authVC.usernameTextField.snp_makeConstraints { make in
            make.width.equalTo(authVC.emailTextField)
            make.centerX.equalTo(authVC.emailTextField)
            make.top.equalTo(authVC.passwordTextField.snp_bottom)
            make.height.equalTo(authVC.emailTextField)
        }
        
        authVC.descriptionTextField.snp_makeConstraints { make in
            make.width.equalTo(authVC.emailTextField)
            make.height.equalTo(authVC.emailTextField)
            make.centerX.equalTo(authVC.emailTextField)
            make.top.equalTo(authVC.descriptionInstructionsLabel.snp_bottom).offset(descriptionTextFieldTopToAddImageButtonButtonOffset)
        }
        
        authVC.addProfileImageFromCameraButton.snp_makeConstraints { make in // MAKE CIRCLE
            make.width.equalTo(authVC.view).multipliedBy(addImageButtonWidthToViewWidthFactor)
            make.height.equalTo(authVC.addProfileImageFromCameraButton.snp_width)
            make.right.equalTo(authVC.view.snp_centerX).offset(-30)
            make.top.equalTo(authVC.view).offset(addImageButtonTopToViewTopOffset)
        }
        
        authVC.addProfileImageFromPhotosButton.snp_makeConstraints { make in
            make.width.equalTo(authVC.addProfileImageFromCameraButton)
            make.height.equalTo(authVC.addProfileImageFromCameraButton)
            make.top.equalTo(authVC.addProfileImageFromCameraButton)
            make.left.equalTo(authVC.view.snp_centerX).inset(30)
        }
        
        authVC.descriptionInstructionsLabel.snp_makeConstraints { make in
            make.width.equalTo(authVC.view).multipliedBy(0.90)
            make.height.equalTo(40)
            make.top.equalTo(authVC.view).offset(100)
            make.centerX.equalTo(authVC.view)
        }
        
        authVC.imageInstructionsLabel.snp_makeConstraints { make in
            make.width.equalTo(authVC.view).multipliedBy(0.90)
            make.height.equalTo(40)
            make.top.equalTo(authVC.addProfileImageFromCameraButton.snp_bottom).offset(40)
            make.centerX.equalTo(authVC.view)
        }
        
        authVC.spinner.snp_makeConstraints { make in
            make.center.equalTo(authVC.view.snp_center)
        }
        
    }
    
    // MARK: - AuthTextField
    
    enum AuthTextField {
        case Email, Password, Username, Description
        
        var textfield: UITextField {
            switch self {
            case Email:       return TextField.Email.textField
            case Password:    return TextField.Password.textField
            case Username:    return TextField.Username.textField
            case Description: return TextField.UserDescription.textField
            }
        }
    }
        
    // MARK: - BarButtonItem
    
    enum BarButtonItem {
        case NavigateToLogin
        
        var barButtonItem: UIBarButtonItem {
            let b = UIBarButtonItem()
            b.title = "Login"
            return b
        }
    }
    
    enum AuthButton {
        case AddImageFromCamera, AddImageFromPhotos
        
        var button: UIButton {
            switch self {
            case AddImageFromCamera: return Button.AddImageFromCamera.button
            case AddImageFromPhotos: return Button.AddImageFromPhotos.button
            }
        }
    }
    
    enum AuthLabel {
        case ImageInstructions, DescriptionInstructions
        
        var label: UILabel {
            switch self {
            case ImageInstructions:       return Label.ImageInstructions.label
            case DescriptionInstructions: return Label.DescriptionInstructions.label
            }
        }
    }
    
    enum AuthActivityIndicator {
        case AuthenicationActivity
        
        var indicator: UIActivityIndicatorView {
            return ActivityIndicator.WhiteLarge.indicator
        }
    }
    
}





