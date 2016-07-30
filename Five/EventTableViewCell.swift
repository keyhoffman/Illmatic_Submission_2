//
//  EventTableViewCell.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

final class EventTableViewCell: UITableViewCell, Configurable {
    
    var eventContainerView: EventContainerView?
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure(withItem event: Event) {
        eventContainerView = EventContainerView(frame: self.frame, event: event)
        EventCellStyleSheet.Prepare(self)
    }
}
