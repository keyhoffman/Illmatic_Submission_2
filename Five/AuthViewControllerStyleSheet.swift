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
    
    private static let addImageButtonWidthToViewWidthFactor   = 0.60
    private static let addImageButtonTopToViewTopOffsetFactor = 0.20
    
    private static let descriptionTextFieldTopToAddImageButtonButtonOffset = 50.0
    
    static func Prepare(authVC: AuthenticationViewController) {
        authVC.view.backgroundColor = Color.FiveBlue.color
        
        let viewHeight = authVC.view.bounds.height
        
        let emailTextFieldTopToViewTopOffset = viewHeight * CGFloat(emailTextFieldTopToViewTopOffsetFactor)
        let addImageButtonTopToViewTopOffset = viewHeight * CGFloat(addImageButtonTopToViewTopOffsetFactor)
        
        authVC.passwordTextField.hidden     = true
        authVC.usernameTextField.hidden     = true
        authVC.descriptionTextField.hidden  = true
        authVC.addProfileImageButton.hidden = true
        
        authVC.emailTextField.becomeFirstResponder()
        
        authVC.view.addSubview(authVC.emailTextField)
        authVC.view.addSubview(authVC.passwordTextField)
        authVC.view.addSubview(authVC.usernameTextField)
        
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
        
        authVC.addProfileImageButton.snp_makeConstraints { make in // MAKE CIRCLE
            make.width.equalTo(authVC.view).multipliedBy(addImageButtonWidthToViewWidthFactor)
            make.height.equalTo(authVC.addProfileImageButton.snp_width)
            make.top.equalTo(authVC.view).offset(addImageButtonTopToViewTopOffset)
        }
        
        authVC.descriptionTextField.snp_makeConstraints { make in
            make.width.equalTo(authVC.emailTextField)
            make.height.equalTo(authVC.emailTextField)
            make.top.equalTo(authVC.addProfileImageButton.snp_bottom).offset(descriptionTextFieldTopToAddImageButtonButtonOffset)
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
        case AddProfileImage
        
        var button: UIButton {
            switch self {
            case AddProfileImage: return Button.AddProfileImage.button
            }
        }
    }
    
}





