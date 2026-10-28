//
//  ContentView.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 21/10/26.
//

import SwiftUI

struct ContentView: View {
    @State private var viewModel = EventsViewModel()
    @State private var animateCards = false
    private let columns = [

        GridItem(.adaptive(minimum: 160))
    ]
    var body: some View {
        TabView {
            MainEventView()
                .tabItem {

                    Label(
                        "Events",
                        systemImage: "calendar"
                    )
                }

            EventsMapView()
                .tabItem {
                    Label(
                        "Map",
                        systemImage: "map.fill"
                    )
                }
        }
    }
}

#Preview {
    ContentView()
}
