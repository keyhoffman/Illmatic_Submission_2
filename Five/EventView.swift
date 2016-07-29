//
//  EventView.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

final class EventView: UIView {

    let titleLabel = EventViewStyleSheet.EventLabel.Title.label
    
    let event: Event
    
    init(frame: CGRect, event: Event) {
        self.event = event
        
        super.init(frame: frame)
        EventViewStyleSheet.Prepare(self)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
