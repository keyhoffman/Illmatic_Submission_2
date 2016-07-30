//
//  EventDetailViewStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

struct EventDetailViewStyleSheet: ViewPreparer {
    
    private static let joinEventButtonWidthToEventDetailViewWidthFactor   = 0.90
    private static let joinEventButtonHeightToEventDetailViewHeightFactor = 0.10
    
    static func Prepare(eventDetailView: EventDetailView) {
        
        eventDetailView.backgroundColor = Color.White.color
        
        eventDetailView.addSubview(eventDetailView.joinEvenButton)
        
        eventDetailView.joinEvenButton.snp_makeConstraints { make in
            make.center.equalTo(eventDetailView.snp_center)
            make.width.equalTo(eventDetailView.snp_width).multipliedBy(joinEventButtonWidthToEventDetailViewWidthFactor)
            make.height.equalTo(eventDetailView.snp_height).multipliedBy(joinEventButtonHeightToEventDetailViewHeightFactor)
        }
    }
    
    enum EventDetailButton {
        case JoinEvent
        
        var button: UIButton {
            switch self {
            case JoinEvent: return Button.JoinEvent.button
            }
        }
    }
}
