//
//  EventContainerView.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import UIKit

final class EventContainerView: UIView {
    
    let eventView: EventView
    let eventDetailView: EventDetailView
    
    let eventViews: [UIView]
    
    let creatorImageView = UIImageView()
    
    let event: Event
    
    let userTap = UITapGestureRecognizer()
    
    var flipFromEventViewToDetailEventView = true
    
    var flipAnimationDuration = 0.5
    
    init(frame: CGRect, event: Event) {
        self.event = event
        
        eventView = EventView(frame: frame, event: event)
        eventDetailView = EventDetailView(frame: frame, event: event)
        
        eventViews = [eventDetailView, eventView]
        
        super.init(frame: frame)
        
        EventContainerViewStyleSheet.Prepare(self)
        
        self.userInteractionEnabled = true
        self.addGestureRecognizer(userTap)
        userTap.addTarget(self, action: #selector(flipEventViews))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func flipEventViews() {
        
        let transitionOptions: UIViewAnimationOptions = [.TransitionFlipFromLeft, .ShowHideTransitionViews]
        
        let topView    = flipFromEventViewToDetailEventView ? eventView : eventDetailView
        let bottomView = flipFromEventViewToDetailEventView ? eventDetailView : eventView
        
        topView.hidden = true
        
        UIView.transitionFromView(topView, toView: bottomView, duration: flipAnimationDuration, options: transitionOptions) { _ in
            self.flipFromEventViewToDetailEventView = !self.flipFromEventViewToDetailEventView
        }
        
        
    }
    
}
