# MoodCast

This is a Flutter application that provides weather information using the OpenWeather API. The app is designed with a focus on clean architecture, ensuring separation of concerns and maintainability.

## Features
- **OpenWeather API Integration**: Fetches real-time weather data and a 7-day weather forecast for specified locations.
- **Freezed Model**: Utilizes the Freezed package to create immutable data models, ensuring type safety and reducing boilerplate code.
- **Clean Architecture**: Employs a layered architecture to separate business logic, data access, and presentation layers, making the codebase more modular and easier to test.
- **Responsive UI**: Designed for a smooth user experience, with clear navigation and interactive elements.

## Structure
The project follows a clear directory structure, allowing for easy navigation through various components:
- **Models**: Contains data models defined using Freezed.
- **Repositories**: Handles API calls and data management.
- **Screens**: Defines the UI components and pages of the application.
- **Services**: Contains utility functions and services for the app.
