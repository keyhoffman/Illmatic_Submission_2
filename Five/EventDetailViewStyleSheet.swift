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
    
    private static let joinEventButtonWidthToViewWidthFactor   = 0.90
    private static let joinEventButtonHeightToViewHeightFactor = 0.10
    
    private static let labelWidthToViewWidthFactor   = 0.90
    private static let labelHeightToViewHeightFactor = 0.07
    
    private static let seperatorHeightToViewHeightFactor = 0.005
    
    private static let hostLabelTopToViewTopOffsetByViewHeightFactor:                      CGFloat = 0.07
    private static let titleLableTopToHostLabelBottomOffsetByViewHeightFactor:             CGFloat = 0.05
    private static let topSeperatorTopToTitleLabelBottomOffsetByViewHeightFactor:          CGFloat = 0.05
    private static let detailsLabelTopToTopSeperatorBottomOffsetByViewHeightFactor:        CGFloat = 0.07
    private static let bottomSeperatorTopToDetailsLabelBottomOffsetByViewHeightFactor:     CGFloat = 0.08
    private static let descriptionLabelTopToBottomSeperatorBottomOffsetByViewHeightFactor: CGFloat = 0.07
    private static let joinEventBottomTopToDescriptionLabelBottomOffsetByViewHeightFactor: CGFloat = 0.03
    
    static func Prepare(eventDetailView: EventDetailView) {
        
        defer { eventDetailView.layoutIfNeeded() }
        
        eventDetailView.backgroundColor = Color.White.color
        
        let viewHeight = eventDetailView.frame.height
        
        let hostLabelTopToViewTopOffset                      = viewHeight * hostLabelTopToViewTopOffsetByViewHeightFactor
        let titleLabelTopToHostLabelBottomOffset             = viewHeight * titleLableTopToHostLabelBottomOffsetByViewHeightFactor
        let topSeperatorTopToTitleLabelBottomOffset          = viewHeight * topSeperatorTopToTitleLabelBottomOffsetByViewHeightFactor
        let detailsLabelTopToTopSeperatorBottomOffset        = viewHeight * detailsLabelTopToTopSeperatorBottomOffsetByViewHeightFactor
        let bottomSeperatorTopToDetailsLabelBottomOffset     = viewHeight * bottomSeperatorTopToDetailsLabelBottomOffsetByViewHeightFactor
        let descriptionLabelTopToBottomSeperatorBottomOffset = viewHeight * descriptionLabelTopToBottomSeperatorBottomOffsetByViewHeightFactor
        let joinEventBottomTopToDescriptionLabelBottomOffset = viewHeight * joinEventBottomTopToDescriptionLabelBottomOffsetByViewHeightFactor
        
        let event = eventDetailView.event
        
        let hostLabelText        = "Host: " + eventDetailView.host.username
        let titleLabelText       = event.title
        let detailsLabelText     = event.date + "\n" + event.location
        let descriptionLabelText = event.description
        
        eventDetailView.hostLabel.text        = hostLabelText
        eventDetailView.titleLabel.text       = titleLabelText
        eventDetailView.detailsLabel.text     = detailsLabelText
        eventDetailView.descriptionLabel.text = descriptionLabelText
        
        for view in eventDetailView.eventDetailSubViews {
            eventDetailView.addSubview(view)
            view.snp_makeConstraints { make in
                make.centerX.equalTo(eventDetailView.snp_centerX)
            }
        }
        
        for view in eventDetailView.seperators {
            eventDetailView.addSubview(view)
            view.snp_makeConstraints { make in
                make.width.equalTo(eventDetailView.snp_width)
                make.height.equalTo(eventDetailView.snp_height).multipliedBy(seperatorHeightToViewHeightFactor)
                make.centerX.equalTo(eventDetailView.snp_centerX)
            }
        }
        
        for view in eventDetailView.eventDetailSubViews where view is UILabel {
            view.snp_makeConstraints { make in
                make.width.equalTo(eventDetailView.snp_width).multipliedBy(labelWidthToViewWidthFactor)
            }
        }
        
        eventDetailView.hostLabel.snp_makeConstraints { make in
            make.top.equalTo(eventDetailView.snp_top).offset(hostLabelTopToViewTopOffset)
        }
        
        eventDetailView.titleLabel.snp_makeConstraints { make in
            make.top.equalTo(eventDetailView.hostLabel.snp_bottom).offset(titleLabelTopToHostLabelBottomOffset)
        }
        
        eventDetailView.topSeperator.snp_makeConstraints { make in
            make.top.equalTo(eventDetailView.titleLabel.snp_bottom).offset(topSeperatorTopToTitleLabelBottomOffset)
        }
        
        eventDetailView.detailsLabel.snp_makeConstraints { make in
            make.top.equalTo(eventDetailView.topSeperator.snp_bottom).offset(detailsLabelTopToTopSeperatorBottomOffset)
        }
        
        eventDetailView.bottomSeperator.snp_makeConstraints { make in
            make.top.equalTo(eventDetailView.detailsLabel.snp_bottom).offset(bottomSeperatorTopToDetailsLabelBottomOffset)
        }
        
        eventDetailView.descriptionLabel.snp_makeConstraints { make in
            make.top.equalTo(eventDetailView.bottomSeperator.snp_bottom).offset(descriptionLabelTopToBottomSeperatorBottomOffset)
        }
        
        eventDetailView.joinEventButton.snp_makeConstraints { make in
            make.top.lessThanOrEqualTo(eventDetailView.descriptionLabel.snp_bottom).offset(joinEventBottomTopToDescriptionLabelBottomOffset).priorityLow()
            make.bottom.lessThanOrEqualTo(eventDetailView.snp_bottom).offset(100).priorityHigh()
            make.width.equalTo(eventDetailView.snp_width).multipliedBy(joinEventButtonWidthToViewWidthFactor)
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
    
    enum EventDetailLabel {
        case Host, Title, Detail, Description, Seperator
        
        var label: UILabel {
            switch self {
            case Host:        return Label.EventDetailHost.label
            case Title:       return Label.EventDetailTitle.label
            case Detail:      return Label.EventDetailDetails.label
            case Description: return Label.EventDetailDescription.label
            case Seperator:   return Label.Seperator.label
            }
        }
    }
}
