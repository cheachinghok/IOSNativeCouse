//
//  EventsService.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 21/10/26.
//

import Foundation

class EventsService {

//    private let networkService = NetworkService()

    private let apiKey = "1f04a72cdf98c21f1fa555b66b34232f"

    func fetchJSONData() async throws -> EventsResponse {
        
        let url = URL(string: "https://cf-courses-data.s3.us.cloud-object-storage.appdomain.cloud/F3Y3rrlatukAJ_mAJT4a8Q/events.json")!
        let decoder = JSONDecoder()
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        
        guard let httpResponse = response as? HTTPURLResponse,
              (200...299).contains(httpResponse.statusCode) else {
            throw APIError.invalidResponse
        }
        decoder.dateDecodingStrategy = .iso8601
//        let events =
        return try decoder.decode(
            EventsResponse.self,
            from: data
        )
//        return events
//
//        let events = try decoder.decode(
//            EventsResponse.self,
//            from: data
//        )
//
//        var components = URLComponents(
//            string: "https://api.openweathermap.org/data/2.5/weather"
//        )
//
//        components?.queryItems = [
//            URLQueryItem(name: "q", value: city),
//            URLQueryItem(name: "appid", value: apiKey),
//            URLQueryItem(name: "units", value: "imperial")
//        ]
//
//        guard let url = components?.url else {
//            throw APIError.invalidResponse
//        }
//
//        let response: WeatherResponse =
//            try await networkService.fetch(url: url)
//
//        return data
    }
}
