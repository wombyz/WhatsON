//
//  Event.swift
//  WhatsON
//
//  Created by Liam Ottley on 13/12/17.
//  Copyright © 2017 Liam Ottley. All rights reserved.
//

import Foundation
import MapKit

class Event: Hashable {

    var _title: String!
    var _thumb: UIImage!
    var _description: String!
    var _ageRange: String!
    var _suburb: String!
    var _gender: String!
    var _eventId: Int
    var _coordinate = CLLocationCoordinate2D()
    var _eventType: String!
    private var nextId = 0
//    var hashValue: Int {
//        return self._eventId
//    }

//    static var nextUid = 1
//    static func generateUid() -> Int {
//        return nextUid++
//    }
    
    var title: String {
    if _title == nil {
        
        _title = ""
    }
    return _title
    }
    
    var  eventType: String {
        if _eventType == nil {
            
            _eventType = "Party"
        }
        return _eventType
    }

    var description: String {
    if _description == nil {
        
        _description = ""
    }
    return _description
    }

    var ageRange: String {
    if _ageRange == nil {
        
        _ageRange = "None"
    }
    return _ageRange
    }

    var suburb: String {
    if _suburb == nil {
        _suburb = ""
    }
    return _suburb
    }

    var gender: String {
    if _gender == nil {
        _gender = "Any"
    }
    return _gender
    }
    
    var eventId: Int {
        return _eventId
    }

    var coordinate: CLLocationCoordinate2D {
        return _coordinate
    }

    func generate() -> Int {
        nextId += 1
        return nextId
    }

    
    init(title: String, coordinate: CLLocationCoordinate2D) {
    self._title = title
    self._eventId = Event.generate()
    self._coordinate = coordinate
    }

}
