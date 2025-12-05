# Bravoo

A modern Flutter authentication application featuring Supabase integration with support for email/password and Google Sign-In authentication. This project is built as an interview test to demonstrate mobile development best practices.

## Overview

Bravoo is a showcase Flutter application that implements secure authentication using Supabase as the backend service. The app demonstrates modern mobile development patterns, including state management, API integration, and user authentication workflows.

## ✨ Features

- **Email & Password Authentication** - Traditional email/password signup and login
- **Google Sign-In** - OAuth 2.0 authentication via Google
- **Supabase Integration** - Backend authentication and user management
- **Cross-Platform** - Support for iOS and Android
- **Responsive Design** - Optimized UI for various screen sizes
- **Secure Token Management** - Proper handling of authentication tokens

## 🚀 Getting Started

### Prerequisites

- Flutter SDK (3.0 or higher)
- Dart SDK (3.0 or higher)
- iOS: Xcode and CocoaPods
- Android: Android Studio and Android SDK
- A Supabase project account

### Installation

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd bravoo
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Configure Supabase**
   - Create a project on [Supabase](https://supabase.com)
   - Add your Supabase URL and Anon Key to your configuration
   - Enable Email/Password and Google authentication providers

4. **Set up Google Sign-In**
   - Follow the [Google Sign-In setup guide](https://pub.dev/packages/google_sign_in)
   - Configure OAuth credentials for both iOS and Android

5. **Add environment file**
   - Add the following keys in the environment file
   ```bash
    WEB_CLIENT_ID='google web oauth id'
    ANDROID_CLIENT_ID='andriod oauth id'
    IOS_CLIENT_ID='NOT SET FOR DEV'
    SUPABASE_PROJECT_URL='project url'
    SUPABASE_API_KEY='supabase anon api key'
   ```

5. **Run the app**
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── main.dart                 # Application entry point
├── src/
│   ├── bravoo_app.dart      # Main app widget
│   ├── setup_main.dart       # App initialization
│   ├── core/                 # Core utilities and constants
│   └── features/             # Feature modules
│       ├── auth/             # Authentication feature
│       ├── home/             # Home ui
│       └── onboarding/       # Splashscreen
└── gen/
    └── assets.gen.dart       # Generated assets
```

## 🔐 Authentication Flow

### Email & Password Authentication
1. User enters email and password
2. Request sent to Supabase authentication endpoint
3. User navigated to home screen

### Google Sign-In Authentication
1. User taps "Sign in with Google"
2. Google authentication dialog opens
3. ID token obtained from Google
4. Token sent to Supabase for user creation/login
5. Session established and user navigated to home screen

## 🛠️ Technologies Used

- **Flutter** - Cross-platform mobile framework
- **Supabase** - Backend-as-a-Service (BaaS) platform
- **Google Sign-In** - OAuth authentication provider
- **Dart** - Programming language

## 📺 Demo Video

[Watch the demo video here](https://asset.cloudinary.com/aniobi/d53e945cf566425b83d7a2c89ec9e759)

## 📚 Key Dependencies

- `supabase_flutter` - Supabase client library
- `google_sign_in` - Google authentication
- `flutter_bloc` or state management of choice

See `pubspec.yaml` for complete dependency list.

## 📝 Development Notes

- The app uses secure token storage for authentication sessions
- All API calls are properly error-handled
- The UI is built with responsive design principles
- Follow Flutter best practices for code organization and naming conventions

## 🐛 Known Issues

None at this time.

## 📄 License

This project is provided as-is for interview and educational purposes.

## 👤 Author

Created as a Flutter interview test project.

---

**Last Updated:** December 2025
