//
//  AuthenticationViewController.swift
//  Five
//
//  Created by Key Hoffman on 7/26/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

class AuthenticationViewController: UIViewController, UITextFieldDelegate {
    let im = UIImageView()
    let canBut = Button.Cancel.button
    let saveBut = Button.SaveEvent.button
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.FiveRed.color
        
        view.addSubview(im)
        view.addSubview(canBut)
        view.addSubview(saveBut)
        
        im.image = IconAssest.HandGray.icon
        
        im.snp_makeConstraints { make in
            make.height.equalTo(50)
            make.width.equalTo(50)
            make.top.equalTo(view.snp_top)
            make.centerX.equalTo(view.snp_centerX)
        }
        
        saveBut.snp_makeConstraints { (make) in
            make.center.equalTo(view.snp_center)
        }
        
        canBut.snp_makeConstraints { (make) in
            make.centerX.equalTo(view.snp_centerX)
            make.top.equalTo(saveBut.snp_bottom)
        }
    }
}

// 55 112 255