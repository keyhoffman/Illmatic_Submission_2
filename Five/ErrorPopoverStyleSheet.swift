//
//  ErrorPopoverStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/28/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import PopupDialog

struct ErrorPopoverStyleSheet: ViewPreparer {
    
    static func Prepare(errorPopover: PopupDialog) {
        
        errorPopover.transitionStyle = .ZoomIn
        
        
        let pv = PopupDialogDefaultView.appearance()
        pv.titleFont    = Font.HelveticaNeue(size: 16).font
        pv.titleColor   = Color.White.color
        pv.messageFont  = Font.HelveticaNeueLight(size: 14).font
        pv.messageColor = Color.WhiteGrayScale08.color
        
        let pcv = PopupDialogContainerView.appearance()
        pcv.backgroundColor = Color.DarkGray.color
        pcv.cornerRadius    = 2
        pcv.shadowEnabled   = true
        pcv.shadowColor     = Color.Black.color
        
        let ov = PopupDialogOverlayView.appearance()
        ov.blurEnabled = true
        ov.blurRadius  = 50
        ov.liveBlur    = true
        ov.opacity     = 0.7
        ov.color       = Color.Black.color

    }
}