//
//  EventCellStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

struct EventCellStyleSheet: ViewPreparer {
    
    static private let eventContainerViewWidthToEventCellWidthFactor   = 0.90
    static private let eventContainerViewHeightToEventCellHeightFactor = 0.80
    
    static func Prepare(eventCell: EventTableViewCell) {
        
        eventCell.backgroundColor = Color.FiveGray.color
        
        guard let eventContainerView = eventCell.eventContainerView else { return }
        
        eventCell.addSubview(eventContainerView)
        
        eventContainerView.snp_makeConstraints { make in
            make.height.equalTo(eventCell.snp_height).multipliedBy(eventContainerViewHeightToEventCellHeightFactor)
            make.center.equalTo(eventCell.snp_center)
            make.width.equalTo(eventCell.snp_width).multipliedBy(eventContainerViewWidthToEventCellWidthFactor)
            
        }
        
    }
}
