////
////  EventsResponse.swift
////  LocalEventExplorer
////
////  Created by Chinghok on 21/10/26.
////
//import Foundation
//
//struct EventsResponse : Codable {
//    
//    let eventID: String
//    let eventName: String
//    let city: String
//    let venue: String
//    let coordinates: String
//    let eventDate: [Event]
//    let priceRange: String
//
//}

import Foundation

struct EventsResponse: Decodable {
    let lastUpdated: Date
    let events: [Event]

    enum CodingKeys: String, CodingKey {
        case lastUpdated = "last_updated"
        case events
    }
}


