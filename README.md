# CloudWeather

![image](https://badgen.net/badge/Flutter/3.24.3)

### Technologies Used

This mobile application has the following technologies:

- Flutter (3.24.3)
- Clean Architecture
- Dependency Injection
- Route Management
- State Management
- Data Persistence
- API communication

### Architecture (Clean Architecture)

- `data`: outermost layer responsible for external communications
- `di`: dependency injection
- `domain`: innermost layer responsible for the business logic of the app
- `env`: environments
- `infra`: implementations of external libraries
- `presentation`:
  - `controllers`: state management and screen action controls
- `ui`: view layer

### Principles

      SOLID, KISS and DRY

### Installation

1. If you don't have flutter installed, [click here](https://flutter.dev/docs/get-started/install/) and read its documentation.
2. Install Flutter 3.24.3
3. Clone the project and go to the root folder.
4. Run the `flutter pub get` command to download the dependencies.
5. Run the `flutter run --dart-define-from-file=lib/env/.env` command.

### Tests

- To run the unit tests, run the following command
  `flutter test test/`
- To run the integration tests, run the following command
  `flutter test --dart-define-from-file=lib/env/.env integration_test/`
