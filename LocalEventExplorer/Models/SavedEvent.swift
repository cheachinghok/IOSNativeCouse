//
//  SavedEvent.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 21/10/26.
//
import Foundation
import SwiftData

@Model
class SavedEvent {

    var eventName: String
    var eventID: String
    var city: String
    var venue: String
    var coordinates: String
    var eventDate: String
    var priceRange: String
    var date_save: String = Date().description
    
    init(
        eventName: String,
        eventID: String,
        city: String,
        venue: String,
        coordinates: String,
        eventDate: String,
        priceRange: String,
        date_save: String = Date().description
    ) {

        self.eventName = eventName
        self.eventID = eventID
        self.city = city
        self.venue = venue
        self.coordinates = coordinates
        self.eventDate = eventDate
        self.priceRange = priceRange
        self.date_save = date_save
    }
}
