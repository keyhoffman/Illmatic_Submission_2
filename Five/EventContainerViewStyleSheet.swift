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
    
    private static let hostImageViewHeightToViewHeightFactor: CGFloat = 0.10
    
    static func Prepare(eventContainerView: EventContainerView) {
        
        defer { eventContainerView.layoutIfNeeded() }
        
        eventContainerView.flipAnimationDuration = 0.5
        
        eventContainerView.eventView.layer.cornerRadius       = eventViewCornerRadius
        eventContainerView.eventDetailView.layer.cornerRadius = eventViewCornerRadius
        
        for view in eventContainerView.eventViews {
            eventContainerView.addSubview(view)
            view.snp_makeConstraints { make in
                make.edges.equalTo(eventContainerView.snp_edges)
            }
        }

        eventContainerView.addSubview(eventContainerView.hostImageView)
        
        let hostImageViewHeight = eventContainerView.frame.height * hostImageViewHeightToViewHeightFactor
        
        eventContainerView.hostImageView.makeCircular(withHeight: hostImageViewHeight)
        
        eventContainerView.hostImageView.snp_makeConstraints { make in
            make.height.equalTo(hostImageViewHeight)
            make.width.equalTo(hostImageViewHeight)
            make.centerX.equalTo(eventContainerView.snp_centerX)
            make.centerY.equalTo(eventContainerView.snp_top)
        }
        
        
    }
}
