//
//  Event.swift
//  Five
//
//  Created by Key Hoffman on 7/29/16.
//  Copyright © 2016 Key Hoffman. All rights reserved.
//

import Foundation

struct Event: FBType {
    let key:         String
    let title:       String
    let date:        String
    let location:    String
    let description: String
    let creatorKey:  String
    let storagePath: String
}

extension Event {
    static let Path = "events/"
    static let NeedsAutoKey = true
    static let FBSubKeys    = ["title", "date", "location", "description", "creatorKey", "storagePath"]
}

extension Event {
    static func Create(FBDict: FBDictionary?) -> Result<Event> {
        guard let key = FBDict?["key"] >>> FBString, let title = FBDict?["title"] >>> FBString, let date = FBDict?["date"] >>> FBString,
            let location = FBDict?["location"] >>> FBString, let description = FBDict?["description"] >>> FBString,
            let creatorKey = FBDict?["creatorKey"] >>> FBString, let storagePath = FBDict?["storagePath"] >>> FBString else { return .Failure(instantiationError) }
        
        return .Success(Event(key: key, title: title, date: date, location: location, description: description, creatorKey: creatorKey, storagePath: storagePath))
    }
}

func == (lhs: Event, rhs: Event) -> Bool {
    return lhs.key == rhs.key 
}