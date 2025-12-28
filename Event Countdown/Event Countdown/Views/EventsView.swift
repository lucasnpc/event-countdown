//
//  EventsView.swift
//  Event Countdown
//
//  Created by Lucas Lopes on 27/12/25.
//

import SwiftUI

struct EventsView: View {
    @State private var eventStore = EventStore()
    @State private var navigationPath = NavigationPath()
    
    private var sortedEvents: [Event] {
        eventStore.events.sorted()
    }
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            List {
                ForEach(sortedEvents) { event in
                    NavigationLink(value: event) {
                        EventRow(event: event)
                    }
                }
                .onDelete(perform: deleteEvents)
            }
            .navigationTitle("Events")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        navigationPath.append("add")
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .navigationDestination(for: Event.self) { event in
                EventForm(mode: .edit(event)) { updatedEvent in
                    eventStore.updateEvent(updatedEvent)
                }
            }
            .navigationDestination(for: String.self) { _ in
                EventForm(mode: .add) { newEvent in
                    eventStore.addEvent(newEvent)
                    navigationPath.removeLast()
                }
            }
        }
    }
    
    private func deleteEvents(at offsets: IndexSet) {
        let eventsToDelete = offsets.map { sortedEvents[$0] }
        for event in eventsToDelete {
            eventStore.deleteEvent(event)
        }
    }
}

#Preview {
    EventsView()
}

