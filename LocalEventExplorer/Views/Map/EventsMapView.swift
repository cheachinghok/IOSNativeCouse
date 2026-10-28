//
//  EventsMapView.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 23/10/26.
//
import MapKit
import SwiftUI
import CoreLocation

struct EventsMapView: View {
    private var currentMapStyle: MapStyle {

        switch selectedMapStyle {

        case "Imagery":
            return .imagery

        case "Hybrid":
            return .hybrid

        default:
            return .standard
        }
    }

    @State private var position: MapCameraPosition =
        .region(
            MKCoordinateRegion(
                center: CLLocationCoordinate2D(
                    latitude: 32.7767,
                    longitude: -96.7970
                ),
                span: MKCoordinateSpan(
                    latitudeDelta: 0.1,
                    longitudeDelta: 0.1
                )
            )
        )
    @State private var selectedMapStyle = "Standard"
    @State private var locationManager =
        LocationManager()
    @State private var events: [EventLocation] = [

        EventLocation(
            id:"123123",
            name: "Sunny",
            city: "San Francisco",
            category:  "sport",
            latitude: 37.7749,
            longitude: -122.4194
        ),
    ]
    var body: some View {
        VStack{
            Picker(
                "Map Style",
                selection: $selectedMapStyle
            ){
                
                Text("Standard")
                    .tag("Standard")

                Text("Imagery")
                    .tag("Imagery")

                Text("Hybrid")
                    .tag("Hybrid")
            }
            .pickerStyle(.segmented)
            .padding()

            Map(position: $position){
                ForEach(events) { event in
                    Annotation(
                        event.city,
                        coordinate: CLLocationCoordinate2D(latitude: event.latitude, longitude: event.longitude )
                    ) {
                        EventAnnotationView(
                            eventName: event.name,
                            category: event.category,
                            priceRange: event.city
                        )
                    }
                }
            }
            .mapStyle(
                selectedMapStyle == "Standard"
                ? .standard
                : selectedMapStyle == "Imagery"
                ? .imagery
                : .hybrid
            )
            .overlay(alignment: .bottomTrailing) {

                Button {

                    locationManager.requestPermission()
                    
                    locationManager.requestLocation()

                    withAnimation {

                        position = .userLocation(
                            fallback: .automatic
                        )
                    }

                } label: {

                    Image(
                        systemName:
                            "location.circle.fill"
                    )
                    .font(.system(size: 36))
                    .foregroundStyle(.blue)
                    .padding()
                    .background(.thinMaterial)
                    .clipShape(Circle())
                }
                .padding()
            }
        }
    }
}
#Preview {
    EventsMapView()
    .padding()
}
