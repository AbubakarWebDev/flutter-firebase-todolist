# Flutter Firebase To-Do List

This repository contains a To-Do List application built with Flutter and Firebase. The project demonstrates how to integrate Firebase services with Flutter to build a real-time and feature-rich to-do list application.

## Features

- **Firebase Integration**: Uses Firebase for authentication, real-time database, and cloud storage.
- **Authentication**: Sign up and log in with email/password.
- **Real-Time Updates**: Tasks are updated across devices in real-time using Firebase Realtime Database or Firestore.
- **CRUD Functionality**: Create, Read, Update, and Delete tasks.
- **User-Friendly Interface**: Responsive and intuitive UI built with Flutter widgets.

## Prerequisites

- [Flutter](https://flutter.dev/docs/get-started/install) installed on your machine.
- Firebase project set up. Follow the [Firebase setup guide](https://firebase.google.com/docs/flutter/setup).
- Basic understanding of Dart and Flutter.

## Getting Started

### Installation

1. Clone the repository:

   ```bash
   git clone https://github.com/AbubakarWebDev/flutter-firebase-todolist.git
   cd flutter-firebase-todolist
   ```

2. Install dependencies:

   ```bash
   flutter pub get
   ```

3. Set up Firebase:

   - Create a Firebase project in the [Firebase Console](https://console.firebase.google.com/).
   - Add your `google-services.json` file to the `android/app` directory.
   - Add your `GoogleService-Info.plist` file to the `ios/Runner` directory.
   - Enable Authentication and Realtime Database or Firestore in your Firebase project.

### Running the Application

1. Start the application:

   ```bash
   flutter run
   ```

2. Use an emulator or physical device to view the application.

## Key Features

### Firebase Authentication

- Allows users to sign up and log in with email/password.
- Secure and easy-to-use authentication flow.

### Task Management

- Add new tasks with titles and descriptions.
- Mark tasks as completed or pending.
- Update or delete tasks as needed.

### Real-Time Database/Firestore

- Stores tasks in Firebase Realtime Database or Firestore.
- Updates are synchronized across all connected devices.

## Screenshots

_Add screenshots of the application here to showcase its design and features._

## Learning Outcomes

- Understand how to integrate Firebase services into a Flutter project.
- Manage real-time data and user authentication with Firebase.
- Build a responsive and feature-rich application using Flutter widgets.

## Contributing

Contributions are welcome! If you have ideas for improvements or find any issues, feel free to open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
