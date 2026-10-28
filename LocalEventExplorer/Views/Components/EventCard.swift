//
//  EventCard.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 21/10/26.
//

import SwiftUI
import SwiftData
struct EventCardView: View {
    let eventName: String
    let venueName: String
    let eventDate: String
    let priceMin: Double
    let priceMax: Double
    let category: String
    //format date to display
    func formatEventDate(_ dateString: String) -> String {
        let formatter = ISO8601DateFormatter()

        guard let date = formatter.date(from: dateString) else {
            return dateString
        }

        return date.formatted(
            .dateTime
                .month(.abbreviated)
                .day()
                .year()
        )
    }
//    @Environment(EventsViewModel.self) private var viewModel
//    @Query var savedEvent: [SavedEvent]
//    private func saveCurrentCity() {


        // Toggle: if already saved → remove
//        if let existing = savedEvent.first(where: { $0.city == viewModel.eventsResponse.city }) {
//            print("Deleting saved location \(existing.name)")
//            context.delete(existing)
//            return
//        }
//
//        // Insert parent first, then create children referencing it
//        let location = SavedEvent(
//            eventName: viewModel.citySearchText,
////            latitude: viewModel.currentLatitude,
////            longitude: viewModel.currentLongitude
//        )
//        context.insert(location)
//
//        let baseTemp = Double(viewModel.currentTemperature)
//
//        for dayOffset in 0..<7 {
//
//            let history = WeatherHistory(
//                temperature: baseTemp + Double.random(in: -5...5),
//                condition: viewModel.currentCondition,
//                date: Calendar.current.date(
//                    byAdding: .day,
//                    value: -(6 - dayOffset),
//                    to: .now
//                ) ?? .now
//            )
//
//            history.location = location
//        }
//    }
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // Event name and category
            HStack(alignment: .top, spacing: 12) {
                VStack(alignment: .leading, spacing: 6) {
                    Text(eventName)
                        .font(.title3)
                        .fontWeight(.bold)
                        .foregroundStyle(.primary)
                        .truncationMode(.tail)
                    Label(venueName, systemImage: "mappin.and.ellipse")
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .frame(maxWidth: 100, alignment: .leading)
                        .lineLimit(1)
                        .truncationMode(.tail)
                }

                Spacer(minLength: 4)
                VStack(alignment: .leading, spacing: 6) {
                    Text(category)
                        .font(.caption)
                        .fontWeight(.medium)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 6)
                        .background(.blue.opacity(0.12))
                        .foregroundStyle(.blue)
                        .clipShape(Capsule())
                    Button {
                        
                    }label: {
                        HStack {
                            Image(systemName: "heart") //systemName: isCurrentCitySaved ? "heart.fill" :
                            Text("Save") // isCurrentCitySaved ? "Saved" :
                        }
                        .font(.caption)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 6)
                        .padding(.vertical, 4)
                        .background( Color.blue) //isCurrentCitySaved ? Color.red :
                        .clipShape(Capsule())
                    }
                }
            }

            Divider()

            // Event date and price range
            HStack {
//                Label {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Event date")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                            .lineLimit(1)
                            .truncationMode(.tail)

                        Text(formatEventDate(eventDate))
                            .font(.caption)
                            .fontWeight(.medium)
                    }
//                } icon: {
//                    Image(systemName: "calendar")
//                        .foregroundStyle(.blue)
//                }

                Spacer()

                VStack(alignment: .trailing, spacing: 4) {
                    Text("Max Price")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                    HStack (alignment:.center, spacing: 2) {
//                        Text(priceMin.formatted(.currency(code: "USD")))
//                            .font(.caption2)
//                            .fontWeight(.semibold)
//                            .foregroundStyle(.green)
//                        Text("-")
//                            .font(.subheadline)
////                            .fontWeight(.semibold)
//                            .foregroundStyle(.green)
                        Text(priceMax.formatted(.currency(code: "USD")))
                            .font(.caption2)
                            .fontWeight(.semibold)
                            .foregroundStyle(.green)
                    }
                }
            }
        }
        .padding(16)
        .frame(maxWidth: .infinity, alignment: .leading)
//        .frame(height: 220)
        .background(.background)
        .clipShape(RoundedRectangle(cornerRadius: 16))
        .overlay {
            RoundedRectangle(cornerRadius: 16)
                .stroke(.gray.opacity(0.2), lineWidth: 1)
        }
        .shadow(color: .black.opacity(0.05), radius: 5, y: 2)
    }
}

#Preview {
    EventCardView(
        eventName: "Summer Music Festival",
        venueName: "Riverside Concert Hall",
        eventDate: "2026-06-16T19:30:00Z",
        priceMin : 2.5,
        priceMax : 6.9,
        category: "Music"
    )
    .padding()
}

