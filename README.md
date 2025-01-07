# Mortyverse App

A Flutter-based app that allows users to browse a list of rict and morty characters, view character details, and manage favorite characters using a local database.

---

## **Table of Contents**

1. [Features](#features)
2. [Libraries Used](#libraries-used)
3. [Project Structure](#project-structure)
4. [APK Download](#apk-download)

---

## **Features**

- **List Character**  
  View a paginated list of characters fetched from a remote API.
- **Detail Character**  
  Access detailed information about a specific character.
- **Favorite Character**  
  Save favorite characters locally and view them offline.

---

## **Libraries Used**

The project leverages various Flutter libraries to implement functionality effectively. Below is a list of the dependencies used:

| **Library**       | **Version** | **Purpose**                                               |
| ----------------- | ----------- | --------------------------------------------------------- |
| `carousel_slider` | ^5.0.0      | For displaying image carousels.                           |
| `cupertino_icons` | ^1.0.6      | Provides Cupertino-styled icons.                          |
| `dio`             | ^5.7.0      | A powerful HTTP client for networking.                    |
| `equatable`       | ^2.0.7      | Simplifies value comparisons for Dart objects.            |
| `floor`           | ^1.5.0      | SQLite ORM for local database management.                 |
| `flutter_bloc`    | ^8.1.6      | State management using the Bloc pattern.                  |
| `flutter_svg`     | ^2.0.16     | Rendering SVG images in the app.                          |
| `get_it`          | ^8.0.3      | Service locator for dependency injection.                 |
| `go_router`       | ^14.6.2     | Declarative routing in Flutter.                           |
| `google_fonts`    | ^6.2.1      | Adds support for Google Fonts.                            |
| `intl`            | ^0.20.1     | Formatting dates, times, and numbers.                     |
| `retrofit`        | ^4.4.2      | A type-safe HTTP client generator.                        |
| `skeletonizer`    | ^1.4.2      | Placeholder loading skeletons for better user experience. |
| `sqflite`         | ^2.4.1      | SQLite plugin for Flutter.                                |

### **Dev Dependencies**

| **Library**          | **Version** | **Purpose**                                           |
| -------------------- | ----------- | ----------------------------------------------------- |
| `bloc_test`          | ^9.1.7      | Testing Bloc logic.                                   |
| `build_runner`       | ^2.4.13     | Code generation support (e.g., Retrofit, Floor).      |
| `floor_generator`    | ^1.5.0      | Code generator for Floor ORM.                         |
| `flutter_lints`      | ^3.0.0      | Provides recommended lint rules for Flutter projects. |
| `flutter_test`       | Included    | Built-in framework for testing Flutter apps.          |
| `mockito`            | ^5.4.5      | Creating mocks for testing.                           |
| `mocktail`           | ^1.0.4      | Alternative mocking library for Flutter testing.      |
| `retrofit_generator` | ^9.1.5      | Generates Retrofit API client code.                   |

---

## **Project Structure**

The project follows a modular and clean architecture structure. Below is the breakdown:

### **1. config/**

- **Router**: Manages app navigation and routing using `go_router`.

### **2. core/**

- **constants**: Stores global constants (e.g., API keys, base URLs, etc.).
- **di**: Dependency injection setup using `get_it`.
- **resources**: Centralized resources like assets or translations.
- **utils**: Helper functions and extensions used across the project.
- **theme**: App-wide theme configuration.
- **usecases**: Shared use cases applicable across multiple features.

### **3. features/characters/**

#### **a. data/**

- **data_sources/**
  - **local**: Handles local database interactions using `Floor`.
  - **remote**: Handles remote API calls using `Retrofit`.
- **models**: Data Transfer Objects (DTOs) for managing API and database data.
- **repositories**: Repository implementations for the character feature.

#### **b. domain/**

- **entities**: Business entities representing core app data.
- **repository**: Abstract definitions of repositories.
- **usecases**: Business logic for handling character-related actions.

#### **c. presentation/**

- **bloc/**
  - **character**
    - **local**: Bloc for managing favorite characters stored locally.
    - **remote**: Bloc for managing character list from remote API.
  - **character_detail**
    - **local**: Bloc for managing locally stored character details.
    - **remote**: Bloc for fetching character details from API.
- **pages**: Screens for displaying character-related UI.
- **widgets**: Reusable widgets specific to the character feature.

### **4. ui/**

- **widgets**: App-wide reusable UI components.

---

## **APK Download**

You can download the APK to try the app from the link below:

[**Download Mortyverse App APK**](https://drive.google.com/drive/folders/1lwwZQGB2VLqGqgAGS8uvtJVt6ENS4EI7?usp=sharing)

---
