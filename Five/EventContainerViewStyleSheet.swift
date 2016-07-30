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
    
    static func Prepare(eventContainerView: EventContainerView) {
        
        eventContainerView.layer.cornerRadius = 10
        
        eventContainerView.addSubview(eventContainerView.eventDetailView)
        eventContainerView.addSubview(eventContainerView.eventView)
        
        eventContainerView.eventView.snp_makeConstraints { make in
            make.edges.equalTo(eventContainerView.snp_edges)
        }
        
        eventContainerView.eventDetailView.snp_makeConstraints { make in
            make.edges.equalTo(eventContainerView.snp_edges)
        }
    }
}
