# Flutter Riverpod 6 Examples

A collection of six Flutter examples demonstrating different Riverpod state management providers, adapted from a YouTube tutorial with slight modifications for clarity, improvements, and personal learning purposes.

## 📚 Overview

This repository contains practical Flutter projects using [Riverpod](https://riverpod.dev/) and `hooks_riverpod` to demonstrate various provider types and patterns.

### 🛠 Examples Included

1. **Provider** – Displaying the current date and time.
2. **StateNotifierProvider** – Simple counter app with increment functionality.
3. **FutureProvider** – Fetching weather emojis for selected cities.
4. **StreamProvider** – Displaying a growing list of names from a periodic stream.
5. **ChangeNotifierProvider** – Managing a list of people with add, edit, and delete actions.
6. **Multiple Providers & Filtering** – Managing and filtering a list of films based on favorite status.

---

## 📂 Folder Structure

lib/
│
├── examples/
│ ├── example1.dart # Provider example
│ ├── example2.dart # StateNotifierProvider example
│ ├── example3.dart # FutureProvider example
│ ├── example4.dart # StreamProvider example
│ ├── example5.dart # ChangeNotifierProvider example
│ ├── example6.dart # Films app with filtering
│
└── main.dart # Entry point

---

## 🚀 Getting Started


### Prerequisites
- Flutter SDK installed ([Install Guide](https://flutter.dev/docs/get-started/install))
- Basic understanding of Flutter widgets
- Familiarity with Riverpod concepts

### Installation

```bash
git clone https://github.com/Bandy7/flutter-riverpod-examples.git
cd flutter-riverpod-examples
flutter pub get
flutter run
