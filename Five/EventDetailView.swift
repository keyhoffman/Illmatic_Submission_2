//
//  EventDetailView.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation
import UIKit

final class EventDetailView: UIView {
    
    let hostLabel         = EventDetailViewStyleSheet.EventDetailLabel.Host.label
    let titleLabel        = EventDetailViewStyleSheet.EventDetailLabel.Title.label
    let detailsLabel      = EventDetailViewStyleSheet.EventDetailLabel.Detail.label
    let descriptionLabel  = EventDetailViewStyleSheet.EventDetailLabel.Description.label
    
    let topSeperator    = EventDetailViewStyleSheet.EventDetailLabel.Seperator.label
    let bottomSeperator = EventDetailViewStyleSheet.EventDetailLabel.Seperator.label 
    
    let joinEventButton = EventDetailViewStyleSheet.EventDetailButton.JoinEvent.button
    
    let event: Event
    
    let eventDetailSubViews: [UIView]
    
    let seperators: [UILabel]
    
    init(frame: CGRect, event: Event) {
        self.event = event
        
        eventDetailSubViews = [hostLabel, titleLabel, detailsLabel, descriptionLabel, joinEventButton]
        
        seperators = [topSeperator, bottomSeperator]
        
        super.init(frame: frame)
        EventDetailViewStyleSheet.Prepare(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
