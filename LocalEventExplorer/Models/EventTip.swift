//
//  EventTip.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 21/10/26.
//

import FoundationModels

@Generable
struct EventTip {

    @Guide(description: "Smart business attire is usually a safe choice.")
    var outfitSuggestion: String

    @Guide(description: "CV and certificates, if it is a recruitment or career event.")
    var itemToBring: String

    @Guide(description: "30–60 minutes early if you need to check in or find your seat.")
    var arrivalTip: String
}

extension EventTip {

    static func fallback(for city: String) -> EventTip {
        EventTip(
            outfitSuggestion: "Business/formal event: Suit, dress shirt, trousers, and formal shoes.",
            itemToBring: "National ID or other required identification",
            arrivalTip: "Business meeting or seminar: 10–15 minutes early"
        )
    }
}
