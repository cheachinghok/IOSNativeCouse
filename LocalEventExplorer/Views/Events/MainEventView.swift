//
//  MainEventView.swift
//  LocalEventExplorer
//
//  Created by Chinghok on 28/10/26.
//
import SwiftUI

struct MainEventView: View {
    @State private var viewModel = EventsViewModel()
    @State private var animateCards = false
    private let columns = [

        GridItem(.adaptive(minimum: 160))
    ]
    var body: some View {
        NavigationStack {
            ScrollView {

                VStack(alignment: .leading, spacing: 20) {
                    Text("Events")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    TextField(
                        "Enter city (e.g., Dallas)",
                        text: $viewModel.citySearchText
                    )
                    .textFieldStyle(.roundedBorder)
                    
                    Button("Find Events") {
                        //loading event
                        Task {

                            animateCards = false

                            await viewModel.loadEvents()

                            try? await Task.sleep(
                                for: .milliseconds(150)
                            )

                            withAnimation {

                                animateCards = true
                            }
                        }

                    }
                    .buttonStyle(.borderedProminent)
                    //laoding
                    if viewModel.isLoading {

                        ProgressView("Loading Weather...")
                            .frame(maxWidth: .infinity)
                            .transition(
                                .move(edge: .top)
                                    .combined(with: .opacity)
                            )

                    }
                    //error handle
                    if let errorMessage = viewModel.errorMessage {

                        VStack(spacing: 12) {

                            Text(errorMessage)
                                .foregroundStyle(.red)
                                .transition(
                                    .move(edge: .bottom)
                                        .combined(with: .opacity)
                                )

                            Button("Retry") {

                                Task {
                                    await viewModel.loadEvents()
                                }
                            }
                            .buttonStyle(.borderedProminent)
                        }
                        .animation(
                            .easeInOut(duration: 0.4),
                            value: viewModel.isLoading
                        )
                        .animation(
                            .easeInOut(duration: 0.4),
                            value: viewModel.errorMessage
                        )

                    }
                    LazyVGrid(
                        columns: columns,
                        spacing: 16
                    ) {
                        ForEach(viewModel.eventsResponse)
                        {events in
                            EventCardView(
                                eventName: events.name,
                                venueName: events.venueName,
                                eventDate: events.eventDate,
                                priceMin: events.priceMin,
                                priceMax: events.priceMax,
                                category: events.category
                            )
                            .frame(maxWidth: .infinity)
                            .frame(height: 220)
                        }
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    MainEventView()
}
