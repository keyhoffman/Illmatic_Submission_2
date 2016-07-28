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
    
    static let ValidPasswordCharacterCount = 5
    static let ValidUsernameCharacterCount = 5
    
    static let ValidEmailPredicateArguments = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,32}"
    static let ValidEmailPredicateFormat    = "SELF MATCHES %@"

    static func Prepare(authVC: AuthenticationViewController) {
        authVC.view.backgroundColor = Color.FiveBlue.color
        
        authVC.view.addSubview(authVC.emailTextField)
        authVC.view.addSubview(authVC.passwordTextField)
        authVC.view.addSubview(authVC.usernameTextField)
        
        authVC.emailTextField.snp_makeConstraints { make in
            make.centerX.equalTo(authVC.view.snp_centerX)
            make.width.equalTo(authVC.view).multipliedBy(0.80)
            make.height.equalTo(authVC.view).multipliedBy(0.05)
            make.top.equalTo(authVC.view).offset(authVC.view.bounds.height * 0.20)
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
    }
    
    // MARK: - AuthTextField
    
    enum TextField {
        case Email, Password, Username
        
        var textField: UITextField {
            let tf = UITextField()
            tf.defaultSettings()
            tf.placeholder     = placeholder
            tf.backgroundColor = Color.White.color
            tf.secureTextEntry = secureTextEntry
            tf.hidden          = hidden
            tf.borderStyle     = .RoundedRect
            tf.keyboardType    = self.keyboardType
            return tf
        }
        
        private var placeholder: String {
            switch self {
            case Email:    return "Enter your email"
            case Password: return "Enter your password"
            case Username: return "Enter your username"
            }
        }
        
        private var secureTextEntry: Bool {
            switch self {
            case Password: return true
            default:       return false
            }
        }
        
        private var hidden: Bool {
            switch self {
            case Email: return false
            default:    return true
            }
        }
        
        private var keyboardType: UIKeyboardType {
            switch self {
            case Email: return .EmailAddress
            default:    return .Default
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
    
}