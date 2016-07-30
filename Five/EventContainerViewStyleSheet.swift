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
    
    private static let creatorImageViewHeightToViewHeightFactor = 0.15
    
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

        eventContainerView.addSubview(eventContainerView.creatorImageView)
        
        eventContainerView.creatorImageView.image = ImageAssest.SurferAtSunset.image
        eventContainerView.creatorImageView.contentMode = .ScaleAspectFit
        
        eventContainerView.creatorImageView.snp_makeConstraints { make in
            make.height.equalTo(eventContainerView.snp_height).multipliedBy(creatorImageViewHeightToViewHeightFactor)
            make.width.equalTo(eventContainerView.snp_height).multipliedBy(creatorImageViewHeightToViewHeightFactor)
            make.centerX.equalTo(eventContainerView.snp_centerX)
            make.centerY.equalTo(eventContainerView.snp_top)
        }
        
        let viewHeight = eventContainerView.frame.height * CGFloat(creatorImageViewHeightToViewHeightFactor)
        
        print("viewHeight = \(viewHeight)")
        
        eventContainerView.creatorImageView.frame = CGRect(x: 0, y: 0, width: 75, height: viewHeight)
        eventContainerView.creatorImageView.makeCircular()
        
        
    }
}
