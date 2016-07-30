//
//  EventContainerViewStyleSheet.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit
import SnapKit

struct EventContainerViewStyleSheet: ViewPreparer {
    
    private static let eventViewCornerRadius: CGFloat = 30
    
    static func Prepare(eventContainerView: EventContainerView) {
        
        eventContainerView.flipAnimationDuration = 1.0
        
        eventContainerView.addSubview(eventContainerView.eventDetailView)
        eventContainerView.addSubview(eventContainerView.eventView)
        
        eventContainerView.eventView.layer.cornerRadius = eventViewCornerRadius
        eventContainerView.eventView.snp_makeConstraints { make in
            make.edges.equalTo(eventContainerView.snp_edges)
        }
        
        eventContainerView.eventDetailView.layer.cornerRadius = eventViewCornerRadius
        eventContainerView.eventDetailView.snp_makeConstraints { make in
            make.edges.equalTo(eventContainerView.snp_edges)
        }
    }
}
