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
    
    let hostLabel         = UILabel()
    let eventTitleLabel   = UILabel()
    let eventDetailsLabel = UILabel()
    let descriptionLabel  = UILabel()
    
    let joinEvenButton = EventDetailViewStyleSheet.EventDetailButton.JoinEvent.button
    
    let event: Event
    
    init(frame: CGRect, event: Event) {
        self.event = event
        super.init(frame: frame)
        EventDetailViewStyleSheet.Prepare(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
