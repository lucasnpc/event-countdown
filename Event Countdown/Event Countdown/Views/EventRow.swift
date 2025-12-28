//
//  EventRow.swift
//  Event Countdown
//
//  Created by Lucas Lopes on 27/12/25.
//

import SwiftUI

struct EventRow: View {
    let event: Event
    
    @State private var currentDate = Date()
    @State private var timer: Timer?
    
    private var relativeDateString: String {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter.localizedString(for: event.date, relativeTo: currentDate)
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(event.title)
                .font(.headline)
                .foregroundColor(event.color)
            
            Text(relativeDateString)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding(.vertical, 4)
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    private func startTimer() {
        currentDate = Date()
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            currentDate = Date()
        }
    }
    
    private func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

#Preview {
    List {
        EventRow(event: Event(
            title: "Aniversário",
            date: Date().addingTimeInterval(86400 * 5),
            textColor: .blue
        ))
        EventRow(event: Event(
            title: "Férias",
            date: Date().addingTimeInterval(-86400 * 2),
            textColor: .green
        ))
    }
}

