//
//  EventForm.swift
//  Event Countdown
//
//  Created by Lucas Lopes on 27/12/25.
//

import SwiftUI

enum FormMode {
    case add
    case edit(Event)
}

struct EventForm: View {
    let mode: FormMode
    let onSave: (Event) -> Void
    
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var textColor: Color = .blue
    
    var navigationTitle: String {
        switch mode {
        case .add:
            return "Add Event"
        case .edit(let event):
            return "Edit (\(event.title))"
        }
    }
    
    var isSaveDisabled: Bool {
        title.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
    var body: some View {
        Form {
            Section {
                TextField("Event Title", text: $title)
                    .foregroundColor(textColor)
                
                DatePicker("Date", selection: $date, displayedComponents: [.date, .hourAndMinute])
                
                ColorPicker("Text Color", selection: $textColor)
            }
        }
        .navigationTitle(navigationTitle)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    saveEvent()
                }
                .disabled(isSaveDisabled)
            }
        }
        .onAppear {
            loadEventData()
        }
    }
    
    private func loadEventData() {
        switch mode {
        case .add:
            break
        case .edit(let event):
            title = event.title
            date = event.date
            textColor = event.color
        }
    }
    
    private func saveEvent() {
        let trimmedTitle = title.trimmingCharacters(in: .whitespacesAndNewlines)
        guard !trimmedTitle.isEmpty else { return }
        
        let event: Event
        
        switch mode {
        case .add:
            event = Event(title: trimmedTitle, date: date, textColor: textColor)
        case .edit(let existingEvent):
            event = Event(
                id: existingEvent.id,
                title: trimmedTitle,
                date: date,
                textColor: textColor
            )
        }
        
        onSave(event)
        dismiss()
    }
}

#Preview {
    NavigationStack {
        EventForm(mode: .add) { event in
            print("Saved: \(event.title)")
        }
    }
}

