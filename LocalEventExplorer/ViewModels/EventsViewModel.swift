//
//  EventsViewModel.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 21/10/26.
//
import Foundation
import Observation

@Observable
class EventsViewModel{
    //add service to make me call call to function in EventService
    private let eventsService = EventsService()
    private var events: EventsResponse?
    
    //action reaction state
    var isLoading: Bool = false
    var errorMessage: String?
    
    //update event data
    var eventsResponse: [Event] = []
    var citySearchText = "search city"
    
    
    func loadEvents() async {
        isLoading = true
        errorMessage = nil
        
        do {
            let response = try await eventsService.fetchJSONData()
            
//            self.events = response
//            self.eventsResponse = [response]
            eventsResponse = response.events
            self.citySearchText = response.events.first?.city ?? "search city"
        } catch let error as APIError {
            switch error {

            case .networkUnavailable:
                errorMessage = "Network unavailable."

            case .invalidResponse:
                errorMessage = "Invalid server response."

            case .decodingFailed:
                errorMessage = "Failed to decode weather data."

            case .serverError(let code):
                errorMessage = "Server error: \(code)"
            }
        }catch {
            // Handle any other errors
            errorMessage = error.localizedDescription
        }
        isLoading = false
    }

}
