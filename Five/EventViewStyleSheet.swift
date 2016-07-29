//
//  EventViewStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

struct EventViewStyleSheet: ViewPreparer {
    
    static private let titleLabelWidthToEventViewWidthFactor = 0.90
    
    static func Prepare(eventView: EventView) {
        
        eventView.titleLabel.text = eventView.event.title
        
        eventView.addSubview(eventView.titleLabel)
        
        eventView.titleLabel.snp_makeConstraints { make in
            make.center.equalTo(eventView.snp_center)
            make.width.equalTo(eventView.snp_width).multipliedBy(titleLabelWidthToEventViewWidthFactor)
        }
    }
    
    enum EventLabel {
        case Title
        
        var label: UILabel {
            switch self {
            case Title: return Label.EventViewTitle.label
            }
        }
    }
}

struct EventCellStyleSheet: ViewPreparer {
    
    static private let eventViewWidthToEventCellWidthFactor = 0.90
    
    static func Prepare(eventCell: EventTableViewCell) {
        
        guard let eventView = eventCell.eventView else { return }
        
        eventCell.addSubview(eventView)
        
        eventView.snp_makeConstraints { make in
            make.height.equalTo(eventCell.snp_height)
            make.center.equalTo(eventCell.snp_center)
            make.width.equalTo(eventCell.snp_width).multipliedBy(eventViewWidthToEventCellWidthFactor)
        }
        
    }
}