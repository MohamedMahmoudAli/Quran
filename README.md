# 📖 Quran App

A **Flutter app** to view all Quran surahs using a local JSON file. Lightweight, fast, and works offline.  

![Flutter](https://img.shields.io/badge/Flutter-Blue?logo=flutter&logoColor=white) ![Dart](https://img.shields.io/badge/Dart-0175C2?logo=dart&logoColor=white) ![License](https://img.shields.io/badge/License-MIT-green)

---

## 🌟 Features

- ✅ Display all Quran surahs with their names and numbers  
- 🔍 Search surahs by name  
- 📄 View details of each surah (number of ayahs, English name, etc.)  
- 🌐 Works offline using a local JSON file  
- ⚡ Lightweight and easy to use  

---

## 🛠 Installation

### Prerequisites

- Flutter SDK installed  
- Device or emulator to run the app  

### Steps

1. Clone the repo:

```bash
git clone https://github.com/yourusername/quran_app.git
Navigate to the project:

bash
Copy code
cd quran_app
Install dependencies:

bash
Copy code
flutter pub get
Run the app:

bash
Copy code
flutter run
🗂 JSON File Structure
The app uses a local JSON file assets/quran.json to store surah data. Example:

json
Copy code
[
  {
    "number": 1,
    "name": "Al-Fatiha",
    "englishName": "The Opening",
    "numberOfAyahs": 7
  },
  {
    "number": 2,
    "name": "Al-Baqarah",
    "englishName": "The Cow",
    "numberOfAyahs": 286
  }
]
Add JSON to pubspec.yaml
yaml
Copy code
flutter:
  assets:
    - assets/quran.json
🚀 How it Works
Reads the JSON file on app startup

Displays surahs in a scrollable ListView

Supports search functionality

Tapping a surah shows detailed info

💡 Future Improvements
🎧 Audio recitation for each surah

🌐 Multiple translations

🌙 Dark mode

⭐ Bookmark favorite surahs
