# Event Countdown

An iOS application developed in SwiftUI to manage important events such as holidays, vacations, and birthdays. Users can add upcoming events and see a countdown showing the time remaining, or view the time that has passed since past events.

## 📱 Features

- ✅ **Add Events**: Create new events with title, date, and custom color
- ✅ **Edit Events**: Modify existing events
- ✅ **Delete Events**: Remove events with swipe-to-delete gesture
- ✅ **Real-time Countdown**: View remaining or elapsed time with updates every second
- ✅ **Data Persistence**: Events are automatically saved and persist between app sessions
- ✅ **Custom Colors**: Choose the text color for each event
- ✅ **Automatic Sorting**: Events are sorted by date (soonest first)

## 🛠 Technologies

- **SwiftUI**: Declarative framework for building the interface
- **Swift Observation**: Reactive observation system for state management
- **UserDefaults**: Local data persistence
- **NavigationStack**: Modern SwiftUI navigation
- **RelativeDateTimeFormatter**: Relative date formatting

## 📋 Requirements

- iOS 17.0+
- Xcode 15.0+
- Swift 5.9+

## 🏗 Project Structure

```
Event Countdown/
├── Event_CountdownApp.swift    # App entry point
├── ContentView.swift            # Main view containing EventsView
├── Models/
│   └── Event.swift             # Event data model
├── Services/
│   └── EventStore.swift        # Event manager with persistence
└── Views/
    ├── EventsView.swift        # Main events list
    ├── EventRow.swift          # Individual event row in the list
    └── EventForm.swift         # Form to add/edit events
```

## 📦 Main Components

### Event Model
- `id`: Unique identifier (UUID)
- `title`: Event title
- `date`: Event date
- `textColor`: Custom text color
- Conformances: `Identifiable`, `Comparable`, `Hashable`, `Equatable`, `Codable`

### EventStore
Observable class (`@Observable`) that manages:
- Events list
- CRUD operations (Create, Read, Update, Delete)
- Automatic persistence with UserDefaults

### EventsView
Main view that displays:
- Sorted list of events
- Navigation to add/edit events
- Swipe-to-delete to remove events

### EventRow
Component that displays:
- Event title with custom color
- Formatted relative date (e.g., "in 2 days", "5 minutes ago")
- Timer that updates every second for real-time countdown

### EventForm
Reusable form for:
- Adding new events
- Editing existing events
- Field validation
- Custom color selection

## 🚀 How to Use

1. **Add Event**: Tap the "+" button in the toolbar
2. **Edit Event**: Tap any event in the list
3. **Delete Event**: Swipe the event to the left and confirm deletion
4. **Customize Color**: Use the ColorPicker in the form to choose the text color

## 🎯 SwiftUI Concepts Demonstrated

This project demonstrates:
- **View Modifiers**: Styling and modifying views
- **NavigationStack and NavigationLink**: Modern SwiftUI navigation
- **Parent-child Communication**: Communication between views using closures
- **State and Observation**: Reactive state management with `@Observable`
- **Lists and Swipe Actions**: Interactive lists with gestures
- **Native Components**: ColorPicker, DatePicker
- **Date Formatting**: RelativeDateTimeFormatter for date formatting
- **Data Persistence**: UserDefaults for local data storage

## 📝 Development Notes

- The app uses Swift's modern observation framework (`@Observable`) for state management
- Persistence is done automatically using UserDefaults
- The countdown is updated in real-time using a private Timer in each EventRow
- Events are automatically sorted by date (soonest first)

## 📄 License

This project was developed as part of a SwiftUI course.
