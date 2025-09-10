# Chuck Norris Fact

An iOS app that displays random Chuck Norris facts. Built with SwiftUI.

## Features

- Fetches and displays random Chuck Norris facts
- Simple, clean UI
- Loading and error states
- Unit tests included

## Technologies Used

- Swift
- SwiftUI
- Combine

## Getting Started

### Prerequisites

- Xcode 16.4 or later

### Installation

1. Clone the repository
2. Open `ChuckNorrisFact.xcodeproj` in Xcode.
3. Build and run on a simulator or device.

## Folder Structure

```
ChuckNorrisFact/
├── ChuckNorrisFactApp.swift        # App entry point
├── ChuckNorrisFactService.swift    # Service for fetching facts
├── ChuckNorrisFactView.swift       # Main view
├── ChuckNorrisFactViewModel.swift  # ViewModel for state management
├── Assets.xcassets/                # App icons and colors
├── ...
ChuckNorrisFact.xcodeproj/          # Xcode project files
ChuckNorrisFactTests/               # Unit tests
```

## Usage

- Launch the app to see a random Chuck Norris fact.
- Tap the refresh button (if available) to fetch a new fact.

## Testing

- Unit tests are located in the `ChuckNorrisFactTests` folder.
- Run tests in Xcode using `Cmd+U`.
