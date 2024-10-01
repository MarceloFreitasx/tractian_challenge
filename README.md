# Tractian Challenge

![Flutter Version](https://badgen.net/badge/Flutter/3.24.3)

<video src="assets/test_video.mp4" width="240" height="480" controls></video>

## Technologies Used

This mobile application utilizes the following technologies:

- **Flutter (3.24.3)**
- **Clean Architecture**
- **Dependency Injection**
- **Route Management**
- **State Management**
- **Data Persistence**
- **API Communication**

## Architecture Overview (Clean Architecture)

The project follows the Clean Architecture principles, with the following directory structure:

- `data`: Handles external communications and data sources (e.g., API).
- `di`: Manages dependency injection.
- `domain`: Contains business logic and entities.
- `env`: Environment configuration and setup.
- `infra`: Provides external library implementations.
- `presentation`: Contains UI logic and state management.
  - `controllers`: Manages screen state and actions.
- `ui`: The view layer of the app.

### Principles Followed

- **SOLID**: Ensures clean and maintainable code.
- **KISS**: Keep It Simple, Stupid – for simplicity.
- **DRY**: Don't Repeat Yourself – for code reusability.

## Installation

Follow these steps to set up the project:

1. Install [Flutter](https://flutter.dev/docs/get-started/install) if you haven't already.
2. Ensure you have **Flutter 3.24.3** installed.
3. Clone this repository and navigate to the project root.
4. Run `flutter pub get` to install dependencies.
5. Use the following command to run the app with the correct environment configuration:

   ```bash
   flutter run --dart-define-from-file=lib/env/.env
   ```

## Running Tests

You can run unit and integration tests using the following commands:

- **Unit Tests**:

  ```bash
  flutter test test/
  ```

- **Integration Tests**:
  ```bash
  flutter test --dart-define-from-file=lib/env/.env integration_test/
  ```

## Points to Improve

The following enhancements could improve the user experience and app performance:

- **Data Caching**: Cache frequently accessed data to reduce API calls and improve responsiveness.
- **Infinite Scroll**: Implement infinite scrolling for long lists (e.g., companies or assets) to make navigation smoother.
- **Node Expansion/Collapse**: Allow users to expand or collapse different levels of nodes for better management of large tree structures.
- **Offline Mode**: Enable offline browsing of previously accessed data for uninterrupted access when internet connectivity is unavailable.
- **Alerts and Notifications**: Integrate a system to alert users about critical sensor statuses or maintenance tasks.
- **Data Export**: Provide options to export filtered data or tree views in formats like CSV or PDF.
- **Customization**: Allow users to customize the appearance of the tree view (e.g., font size, colors, icons).
- **Tooltips and Info Panels**: Add tooltips or panels that display additional information when users hover over tree nodes.
- **Accessibility**: Ensure the app meets accessibility guidelines, including features like screen reader compatibility, text scaling, and high-contrast mode.
