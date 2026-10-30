# Tuition Centre Manager

A lightweight Flutter app for managing tuition centre students, classes, and
monthly fee payments. All records are stored locally with SharedPreferences;
the app does not use Firebase, authentication, or a network service.

## Project structure

```text
lib/
  data/
    local_storage.dart
  models/
    models.dart
  providers/
    centre_provider.dart
  screens/
    dashboard_screen.dart
    fees_screen.dart
    main_shell.dart
    settings_screen.dart
    student_form_screen.dart
    students_screen.dart
  main.dart
test/
  centre_provider_test.dart
pubspec.yaml
analysis_options.yaml
```

The app has four main navigation destinations (Dashboard, Students, Fees, and
Settings). Add/Edit Student is opened from the Students screen, for five
application screens total.

## Run

Install Flutter, then run these commands from the project directory:

```sh
flutter create --platforms=android,ios .
flutter pub get
flutter run
```

The `flutter create` step supplies the native Android and iOS runner projects.
For automated checks, run `flutter analyze` and `flutter test`.

## Included

- Dashboard totals for enrolled students, current-month collections, and
  outstanding fees.
- Board and class management. New boards start with L.K.G., U.K.G., and
  Classes 1–12.
- Student search and board → class → student organization.
- Optional custom text fields on student profiles.
- Monthly fee status and payment entries for UPI or cash, including partial
  payments.
- On-device persistence with SharedPreferences.
